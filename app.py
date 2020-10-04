import os
import logging
import json

# Setup logging to get lots of information for speeds sake
logging.basicConfig(level=logging.INFO)
logging.getLogger().setLevel(logging.INFO)
logging.info("Starting app")

from flask import Flask, request, jsonify
from threading import Event
from processing.loopthread import LoopThread
from database import connection as db_con

from flask_restful import Resource, Api


STOP_EVENT = Event()
INTERRUPT_EVENT = Event()
thread = LoopThread(STOP_EVENT, INTERRUPT_EVENT)

app = Flask(__name__)
api = Api(app)

@app.route("/interrupt")
def interrupt():
    INTERRUPT_EVENT.set()
    return "OK", 200

# http://flask.pocoo.org/snippets/67/
def shutdown_server():
    func = request.environ.get('werkzeug.server.shutdown')
    if func is None:
        raise RuntimeError('Not running with the Werkzeug Server')
    func()

@app.route("/shutdown")
def shutdown():
    STOP_EVENT.set()
    thread.join()
    shutdown_server()
    return "OK", 200


# Import the actions to map to Flask
from actions.extracts import test_extract

# Setup the routing from URL to code
app.add_url_rule('/', 'root', test_extract)

thread.start()

class api_relationship(Resource):
    def get(self):
        conn = db_con.connect_database()
        cursor = conn.cursor(dictionary=True)
        query = cursor.execute("SELECT * FROM account_relationships where cycle_detected > 0") # This line performs query and returns json result
        records = cursor.fetchall()
        documents = []
        for row in records:
            documents.append(json.loads(row['document']))
        # result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in documents]}
        result = {'data': documents}
        db_con.disconnect_database(conn)
        return jsonify(result) 

api.add_resource(api_relationship, '/relationship')

# Run the app
if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))
