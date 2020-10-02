import os
import logging

from flask import Flask
import pandas as pd

from database import connection as db_con

logging.basicConfig(level=logging.INFO)
logging.info("Starting app")

app = Flask(__name__)


@app.route('/')
def hello_world():
    target = os.environ.get('TARGET', 'World')
    try:
        db = db_con.connect_database()

        df = pd.read_sql("select * from messages limit 10", db)
        data = df.to_html()
        db_con.disconnect_database(db)
    except Exception as e:
        logging.error(e, exc_info=True)
        data = "broken"

    return 'Hello {0}! and also Pete and Alvin and Agus too!\n{1}'.format(target, data)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))