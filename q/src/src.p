
from pyq import q

def Psolve_sudoku(list):
   board = str(q.cut(9, list))

   func = 'Qsolve_sudoku['+board+']'
   print(func)
   
   return q(func)

q.Psolve_sudoku = Psolve_sudoku
