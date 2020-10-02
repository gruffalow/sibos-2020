import os

from flask import Flask
import mysql.connector
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    # target = os.environ.get('TARGET', 'World')
    mydb = mysql.connector.connect(
        host="localhost",
        user=os.environ['DB_USER'],
        password=os.environ['DB_PASS']
    )
    return 'Hello {}! and also Pete! and Alvin and Agus too!\n'.format(mydb)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))