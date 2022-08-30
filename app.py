from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Udacity cloud devops capstone project!'

app.run(host='0.0.0.0', port=80, debug=True)