from  flask import Flask,jsonty


app = Flask(__name__)

@app.route('/')
def index():
    return 'hellp Flask'




@app.route('/book')
def bookIndex():
    resp = {'msg':'','code':200,'data',data}
    return jsonty(resp)




if __name__ == "__main__":
    app.run()




