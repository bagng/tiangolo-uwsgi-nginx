import sys
print (sys.path)

import traceback

from flask import Flask
from flask import request
from flask import Response

app = Flask(__name__)

DEBUG_ENABLE = True

@app.route('/test', methods=['GET', 'POST', 'OPTIONS'])
def handler_test():
    try:
        res = ''
        res += 'request.path = {0}<br>\n'.format(request.path)
        res += 'request.args = {0}<br>\n'.format(request.args) # GET DATA
        res += 'request.data = {0}<br>\n'.format(request.data)
        res += 'request.form = {0}<br>\n'.format(request.form) # POST DATA
        res += 'request.method = {0}<br>\n'.format(request.method)
        res += 'request.headers = {0}<br>\n'.format(str(request.headers))

        res += "<br><br>Hello World from Flask using Python & Docker - test.py by pyinstaller."
        return res, 200
    except Exception as e:
        #print(traceback.format_exc())
        #traceback.print_exc()
        #result['data'] = traceback.format_exc()
        #print(result['data'])
        return traceback.format_exc()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=DEBUG_ENABLE)
    #app.run(host='0.0.0.0', port=8080, ssl_context='adhoc')

