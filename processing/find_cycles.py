import logging
from datetime import datetime
from database import connection as db_con
import pandas as pd

batch_max_size = 1000
processing_summary_insert = "INSERT processing_summary (start, end, start_msg_no, end_msg_no, processed_successfully) VALUES (%s, %s, %s, %s, %s)"


def process_remaining() -> bool:
    start = datetime.now()
    db = db_con.connect_database()

    max_processed_msgno_df = pd.read_sql("SELECT IFNULL((SELECT max(end_msg_no) from processing_summary), -1) AS max_processed_msgno", db)
    max_processed_msgno = max_processed_msgno_df['max_processed_msgno'].iloc[0]
    logging.info("processing from %s", str(max_processed_msgno))
    df = pd.read_sql("select * from messages where msgno > {0} order by msgno limit {1}".format(str(max_processed_msgno), str(batch_max_size)), db)

    if df.empty:
        logging.info("no further messages found")
        db_con.disconnect_database(db)
        return True

    start_msg_no = df['msgno'].iloc[0]
    end_msg_no = df['msgno'].iloc[df.last_valid_index()]

    end = datetime.now()
    cursor = db.cursor()
    cursor.execute(processing_summary_insert, (str(start), str(end), str(start_msg_no), str(end_msg_no), True))
    db.commit()
    db_con.disconnect_database(db)
    return False
