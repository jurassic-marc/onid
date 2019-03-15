
import requests
from bs4 import BeautifulSoup as b_soup
from random import randint

txt_file = '/home/marc/git/onid/sudoku.txt'
scrp_url = 'https://nine.websudoku.com/?level='

def get_diff(d):
    d = int(d)

    if d == 1:
        return 'easy'
    if d == 2:
        return 'medium'
    if d == 3:
        return 'hard'
    else:
        return 'custom'

def scrape_board(diff = randint(1,3)):

    data = requests.get(scrp_url, str(diff))

    soup = b_soup(data.text, 'html.parser')

    grid = soup.find('table', {'id':'puzzle_grid'})

    puzzle = []

    for td in grid.find_all('td'):
        for i in td.find_all('input'):
            try:
               puzzle.append(int(i['value']))
            except:
               puzzle.append(0)

    solution = [int(d) for d in str(soup.find('input', {'id':'cheat'})['value'])]

    return [get_diff(diff), puzzle, solution]

def main():
    with open(txt_file, 'a+') as f:
        for item in scrape_board():
            f.write("%s," % item)
        f.write("\n")

main()
