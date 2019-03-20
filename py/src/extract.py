
def extract_puzzles(puz):

    board = []

    with open(puz, 'r') as f:
        for puzzle in f:
            sgl_b = []
            sgl_b.append(puzzle.split(',')[0])

            str_st = 0
            str_ed = puzzle.find(']', str_st)

            while -1 != str_ed:
                sgl_b.append(map(int,[i.strip() for i in puzzle[1 + puzzle.find('[', str_st): str_ed].split(',')]))
                str_st = str_ed + 1
                str_ed = puzzle.find(']', str_st)
  
            board.append(sgl_b)

    return board

