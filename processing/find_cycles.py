import logging
import json
from datetime import datetime
from database import connection as db_con
import pandas as pd

from utils.api_fx import APIConverter

batch_max_size = 1000
processing_summary_insert = "INSERT processing_summary (start, end, start_msg_no, end_msg_no, processed_successfully) VALUES (%s, %s, %s, %s, %s)"
account_relationships_insert = "INSERT account_relationships (id, document, cycle_detected, cycle_value) VALUES (%s, %s, %s, %s)"
account_relationships_update = "UPDATE account_relationships SET document = %s, cycle_detected = %s, cycle_value = %s WHERE id = %s"
account_relationships_select = "SELECT document FROM account_relationships WHERE id = %s"

apifx = APIConverter()


def process_remaining() -> bool:
    start = datetime.now()
    db = db_con.connect_database()

    max_processed_msgno_df = pd.read_sql("SELECT IFNULL((SELECT max(end_msg_no) from processing_summary), -1) AS max_processed_msgno", db)
    max_processed_msgno = max_processed_msgno_df['max_processed_msgno'].iloc[0]
    logging.info("processing from %s", str(max_processed_msgno))
    df = pd.read_sql("select * from messages where msgno > {0} and sender = 52A and type = '103' order by msgno limit {1}".format(str(max_processed_msgno), str(batch_max_size)), db)

    if df.empty:
        logging.info("no further messages found")
        db_con.disconnect_database(db)
        return True

    cursor = db.cursor(dictionary=True)

    for index, row in df.iterrows():
        amount = 0
        if row['32A_Currency'] != "USD":
            amount = apifx.performUSDFX(row['32A_Currency'], row['32A_Amount'])
        else:
            amount = row['32A_Amount']

        id = "{0}:{1}".format(row['52A'], row['DebtAcc'])
        destination = "{0}:{1}".format(row['57A'], row['BeneAcc'].rstrip())

        cursor.execute(account_relationships_select, (id,))
        account_relationships_record = cursor.fetchone()

        if account_relationships_record is None:
            account_relationships = {
                "id": id,
                "total_debit_USD": amount,
                "destinations": {destination: {"debit_USD": amount, "transaction_count": 1}}
            }
            cursor.execute(account_relationships_insert, (id, json.dumps(account_relationships), False, "0"))
        else:
            account_relationships = json.loads(account_relationships_record['document'])
            account_relationships['total_debit_USD'] = account_relationships['total_debit_USD'] + amount
            destination_details = account_relationships['destinations'].get(destination, {"debit_USD": 0, "transaction_count": 0})
            destination_details['debit_USD'] = destination_details['debit_USD'] + amount
            destination_details['transaction_count'] = destination_details['transaction_count'] + 1
            account_relationships['destinations'][destination] = destination_details
            cursor.execute(account_relationships_update, (json.dumps(account_relationships), False, "0", id))


    start_msg_no = df['msgno'].iloc[0]
    end_msg_no = df['msgno'].iloc[df.last_valid_index()]



    end = datetime.now()

    cursor.execute(processing_summary_insert, (str(start), str(end), str(start_msg_no), str(end_msg_no), True))
    db.commit()
    db_con.disconnect_database(db)
    return False
