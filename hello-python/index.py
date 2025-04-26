#!/usr/bin/env python
from flask import Flask, request
from waitress import serve
import os
from handler import handle

app = Flask(__name__)

@app.route("/", defaults={"path": ""}, methods=["POST", "GET"])
@app.route("/<path:path>", methods=["POST", "GET"])
def main_route(path):
    ret = handle(request.get_data().decode('utf-8'))
    return ret

if __name__ == '__main__':
    serve(app, host='0.0.0.0', port=8080)