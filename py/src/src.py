
import requests
from flask import Flask

app = Flask(__name__)

board = "((5,3,0,0,7,0,0,0,0),(6,0,0,1,9,5,0,0,0),(0,9,8,0,0,0,0,6,0),\
          (8,0,0,0,6,0,0,0,3),(4,0,0,8,0,3,0,0,1),(7,0,0,0,2,0,0,0,6),\
          (0,6,0,0,0,0,2,8,0),(0,0,0,4,1,9,0,0,5),(0,0,0,0,8,0,0,7,9))"

@app.route('/')
def index():
    return 'Hello World'

@app.route('/puzzle/<board>')
def puzzle_url(board):
    d = requests.get('http://127.0.0.1:5001/?Psolve_sudoku enlist '+board)
    
    return d.content

@app.route('/puzzle')
def puzzle():
    d = requests.get('http://127.0.0.1:5001/?Psolve_sudoku enlist '+board)

    return d.content

if __name__ == 'main':
    app.run(debug=True, host='127.0.0.1', port='5000')
