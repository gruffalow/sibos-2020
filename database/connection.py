import os
import time
import sys
import logging

import mysql.connector
from mysql.connector import Error

FORMAT = '%(asctime)-15s %(message)s'
logging.basicConfig(format=FORMAT)
logger = logging.getLogger('roundtrip.database')

# from config import SQL instance connection info, and
# our database information to connect to the db
SQL_HOST = os.environ.get("SQL_HOST", "127.0.0.1") # Defaults to using localhost/Cloud SQL Proxy
DB_PORT  = os.environ.get("DB_PORT", 3306)
DB_USER  = os.environ.get("DB_USER", None)
DB_PASS  = os.environ.get("DB_PASS", None)
DB_NAME  = os.environ.get("DB_NAME", None)

logger.info("dbHost : %s", SQL_HOST)
logger.info("dbPort : %s", DB_PORT)
logger.info("dbUser : %s", DB_USER)
logger.info("dbPass : %s", DB_PASS)
logger.info("dbName : %s", DB_NAME)

# Make sure that we have all the pieces we must have in order to connect to our db properly
if not DB_USER:
    logger.error("You have to specify a database user either by environment variable or pass one in with the -u flag.")
    sys.exit(2)
if not DB_PASS:
    logger.error("You have to specify a database password either by environment variable or pass one in with the -p flag.")
    sys.exit(2)
if not DB_NAME:
    logger.error("You have to specify a database name either by environment variable or pass one in with the -d flag.")
    sys.exit(2)
if not DB_PORT:
    logger.error("You have to specify a database port either by environment variable or pass one in with the -P flag.")
    sys.exit(2)

def connect_database():
    # Wait for our database connection
    db = None
    attempt_num = 0
    wait_amount = 1
    # backoff_count is the static count for how many times we should try at one
    # second increments before expanding the backoff time exponentially
    # Once the wait time passes a minute, we'll give up and exit with an error
    backoff_count = 5
    while db == None:
        try:
            db = mysql.connector.connect(
                host=SQL_HOST,
                user=DB_USER,
                passwd=DB_PASS,
                port=DB_PORT,
                database=DB_NAME
            )
            logger.info("Connected to database successfully")
        except Error as e:
            attempt_num = attempt_num + 1
            if attempt_num >= backoff_count:
                wait_amount = wait_amount * 2
            logger.warning("Couldn't connect to the MySQL instance, trying again in {} second(s).".format(wait_amount))
            logger.warning(e, exc_info=True)
            time.sleep(wait_amount)
            if wait_amount > 60:
                logger.error("Giving up on connecting to the database")
                sys.exit(2)
    return db


def disconnect_database(db):
    db.close()