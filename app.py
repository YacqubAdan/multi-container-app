from flask import Flask
from redis import Redis, ConnectionError

app = Flask(__name__)

try:
    redis = Redis(host='myredis', port=6379, decode_responses=True)
    redis.ping()  # Check if Redis server is running
except ConnectionError:
    print("Could not connect to Redis server.")

@app.route('/')
def hello_world():
    return 'come to Vault!'

@app.route('/count')
def count():
        redis.incr('hits')
        return 'This page has been visited {} times'.format(redis.get('hits'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
