import os
import logging

# Setup logging to get lots of information for speeds sake
logging.basicConfig(level=logging.INFO)
logging.getLogger().setLevel(logging.INFO)
logging.info("Starting app")

from flask import Flask

# Import the actions to map to Flask
from actions.extracts import test_extract

app = Flask(__name__)

# Setup the routing from URL to code
app.add_url_rule('/', 'root', test_extract)

# Run the app
if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))