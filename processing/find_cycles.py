import logging
import json
from datetime import datetime
from database import connection as db_con
import pandas as pd

from utils.api_fx import APIConverter

batch_max_size = 1000
processing_summary_insert = "INSERT processing_summary (start, end, start_msg_no, end_msg_no, processed_successfully) VALUES (%s, %s, %s, %s, %s)"
account_relationships_insert = "INSERT account_relationships_deep (id, document, transaction_count, cycle_detected, cycle_value) VALUES (%s, %s, %s, %s, %s)"
account_relationships_update = "UPDATE account_relationships_deep SET document = %s, transaction_count = %s, cycle_detected = %s, cycle_value = %s WHERE id = %s"
account_relationships_select = "SELECT document, cycle_detected, cycle_value FROM account_relationships_deep WHERE id = %s"

apifx = APIConverter()


def detect_cycles(destination, id, amount, sources):
    cycle_detected = False
    cycle_amount = 0
    for source in sources:
        if source == destination:
            sources[source]['sources'] = {}
            source_cycle_detected = True
            source_cycle_amount = sources[source]['credit_USD']
        else:
            source_cycle_detected, source_cycle_amount = detect_cycles(destination, source, sources[source]['credit_USD'], sources[source]['sources'])

        cycle_detected = cycle_detected | source_cycle_detected
        cycle_amount = cycle_amount + source_cycle_amount

    return cycle_detected, cycle_amount


def add_sources(destination, id, amount, destination_transaction_count, new_sources, visited_destinations, cursor):

    if destination in visited_destinations:
        return

    sources = dict(new_sources)
    cursor.execute(account_relationships_select, (destination,))
    account_relationships_record = cursor.fetchone()

    if account_relationships_record is None:
        account_relationships = {
            "id": destination,
            "transaction_count": 0,
            "total_debit_USD": 0,
            "total_credit_USD": amount,
            "sources": {id: {"credit_USD": amount, "transaction_count": destination_transaction_count, "sources": sources}},
            "destinations": {}
        }
        # truncate sources at destination
        cycle_detected, cycle_amount = detect_cycles(destination, id, amount, sources)
        cursor.execute(account_relationships_insert,
                       (destination, json.dumps(account_relationships), account_relationships['transaction_count'], cycle_detected, cycle_amount))
    else:
        account_relationships = json.loads(account_relationships_record['document'])
        source_details = account_relationships['sources'].get(id, {"credit_USD": 0, "transaction_count": 0, "sources": {}})
        amount_change = amount - source_details['credit_USD']
        source_details['credit_USD'] = source_details['credit_USD'] + amount_change
        source_details['transaction_count'] = destination_transaction_count
        source_details['sources'] = sources
        account_relationships['total_credit_USD'] = account_relationships['total_credit_USD'] + amount_change
        account_relationships['sources'][id] = source_details
        cycle_detected, cycle_amount = detect_cycles(destination, id, source_details['credit_USD'], account_relationships['sources'])
        cursor.execute(account_relationships_update,
                       (json.dumps(account_relationships), account_relationships['transaction_count'], cycle_detected, cycle_amount, destination))

    previous_destinations = visited_destinations.copy()
    previous_destinations.append(destination)

    for onwards_dest in account_relationships['destinations']:
        add_sources(onwards_dest, destination, account_relationships['destinations'][onwards_dest]['debit_USD'], account_relationships['destinations'][onwards_dest]['transaction_count'], account_relationships['sources'], previous_destinations, cursor)


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
        destination_transaction_count = 1

        cursor.execute(account_relationships_select, (id,))
        account_relationships_record = cursor.fetchone()

        if account_relationships_record is None:
            account_relationships = {
                "id": id,
                "transaction_count": 1,
                "total_debit_USD": amount,
                "total_credit_USD": 0,
                "sources": {},
                "destinations": {destination: {"debit_USD": amount, "transaction_count": destination_transaction_count}}
            }
            cursor.execute(account_relationships_insert, (id, json.dumps(account_relationships), account_relationships['transaction_count'], False, "0"))
        else:
            account_relationships = json.loads(account_relationships_record['document'])
            account_relationships['transaction_count'] = account_relationships['transaction_count'] + 1
            account_relationships['total_debit_USD'] = account_relationships['total_debit_USD'] + amount
            destination_details = account_relationships['destinations'].get(destination, {"debit_USD": 0, "transaction_count": 0})
            destination_details['debit_USD'] = destination_details['debit_USD'] + amount
            destination_transaction_count = destination_details['transaction_count'] + 1
            destination_details['transaction_count'] = destination_transaction_count
            account_relationships['destinations'][destination] = destination_details
            cursor.execute(account_relationships_update, (json.dumps(account_relationships), account_relationships['transaction_count'], account_relationships_record['cycle_detected'], account_relationships_record['cycle_value'], id))

        for dest in account_relationships['destinations']:
            add_sources(dest, id, account_relationships['destinations'][dest]['debit_USD'], account_relationships['destinations'][dest]['transaction_count'], account_relationships['sources'], [], cursor)

    start_msg_no = df['msgno'].iloc[0]
    end_msg_no = df['msgno'].iloc[df.last_valid_index()]



    end = datetime.now()

    cursor.execute(processing_summary_insert, (str(start), str(end), str(start_msg_no), str(end_msg_no), True))
    db.commit()
    db_con.disconnect_database(db)
    return False
