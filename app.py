import os
import time
import sys

from flask import Flask
import mysql.connector
from mysql.connector import Error

# from config import SQL instance connection info, and
# our database information to connect to the db
SQL_HOST = os.environ.get("SQL_HOST", "127.0.0.1") # Defaults to using localhost/Cloud SQL Proxy
DB_PORT  = os.environ.get("DB_PORT", 3306)
DB_USER  = os.environ.get("DB_USER", None)
DB_PASS  = os.environ.get("DB_PASS", None)
DB_NAME  = os.environ.get("DB_NAME", None)


# Make sure that we have all the pieces we must have in order to connect to our db properly
if not DB_USER:
    print ("You have to specify a database user either by environment variable or pass one in with the -u flag.")
    sys.exit(2)
if not DB_PASS:
    print ("You have to specify a database password either by environment variable or pass one in with the -p flag.")
    sys.exit(2)
if not DB_NAME:
    print ("You have to specify a database name either by environment variable or pass one in with the -d flag.")
    sys.exit(2)
if not DB_PORT:
    print ("You have to specify a database port either by environment variable or pass one in with the -P flag.")
    sys.exit(2)


# Wait for our database connection
mydb = None
attempt_num = 0
wait_amount = 1
# backoff_count is the static count for how many times we should try at one
# second increments before expanding the backoff time exponentially
# Once the wait time passes a minute, we'll give up and exit with an error
backoff_count = 5

def connect_database():
    global attempt_num
    global wait_amount
    global mydb
    try:
        mydb = mysql.connector.connect(
            host=SQL_HOST,
            user=DB_USER,
            passwd=DB_PASS,
            port=DB_PORT
        )
        print("Connected to database successfully")
    except Error as e:
        attempt_num = attempt_num + 1
        if attempt_num >= backoff_count:
            wait_amount = wait_amount * 2
        print ("Couldn't connect to the MySQL instance, trying again in {} second(s).".format(wait_amount))
        print (e)
        time.sleep(wait_amount)
        if wait_amount > 60:
            print ("Giving up on connecting to the database")
            sys.exit(2)

app = Flask(__name__)

@app.route('/')
def hello_world():
    # target = os.environ.get('TARGET', 'World')
    while mydb == None:
        connect_database()
    return 'Hello {}! and also Pete and Alvin and Agus too!\n'.format(mydb)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))