from database import connection as db_con
import logging


def setup_tables():
    db = db_con.connect_database()
    cursor = db.cursor()

    logging.info("Dropping existing processing tables")
    cursor.execute(
        "DROP TABLE IF EXISTS account_relationships")
    cursor.execute(
        "DROP TABLE IF EXISTS processing_summary")

    logging.info("Creating new processing tables")
    cursor.execute(
        "CREATE TABLE account_relationships (id VARCHAR(255) PRIMARY KEY, document JSON, cycle_detected BOOL, cycle_value DECIMAL(13,2))")
    cursor.execute(
        "CREATE TABLE processing_summary (id INT AUTO_INCREMENT PRIMARY KEY, start DATETIME, end DATETIME, start_msg_no int(11), end_msg_no int(11), processed_successfully BOOL)")

    db.close()
    logging.info("processing table setup complete")
