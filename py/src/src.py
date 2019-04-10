
import requests
from flask import Flask, render_template
from scrape import scrape_board

app = Flask(__name__)

@app.route('/')
def index_render():
    return render_template('index.html')

@app.route('/sudoku/<diff>')
def sudoku_render(diff):
    return render_template('sudoku.html')

@app.route('/puzzle/<diff>')
def fetch_board(diff):
   b = scrape_board(diff)

   return str(b[1])

@app.route('/solve/<board>')
def solve_board(board):
    d = requests.get('http://127.0.0.1:5001/?Psolve_sudoku enlist '+board)

    return d.content

if __name__ == 'main':
    app.run(debug=True, host='127.0.0.1', port='5000')
