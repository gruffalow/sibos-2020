import logging
from database import connection as db_con
import pandas as pd


def test_extract():
    try:
        db = db_con.connect_database()

        df = pd.read_sql("select * from account_relationships where cycle_detected > 0", db)
        data = df.to_html()
        db_con.disconnect_database(db)
    except Exception as e:
        logging.error(e, exc_info=True)
        data = "broken"

    return 'Test Extract\n{0}'.format(data)