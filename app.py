from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'

 
if __name_ == "__name__": 
    app.run(debug=True)
