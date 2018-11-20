\c 30 2000

BOARD_SIZE: `int$9;
 GRID_SIZE: `int$sqrt BOARD_SIZE;  //3
    DIGITS: 1+til BOARD_SIZE;

board: ((0;0;0;0;0;0;0;0;3);(3;6;0;0;0;7;0;0;2);(0;2;0;5;0;6;1;8;0);
        (8;0;4;0;2;0;0;1;6);(0;7;0;0;1;0;0;4;0);(2;5;0;0;6;0;8;0;9);
        (0;9;2;8;0;3;0;7;0);(7;0;0;2;0;0;0;9;4);(1;0;0;0;0;0;0;0;0))


get_row: {board[x-1]}
get_col: {(flip board)[x-1]}

get_grid: {[g] x:floor((g-1)%GRID_SIZE); y:(g-1)mod GRID_SIZE;
               flip(flip board[(GRID_SIZE*x)+til GRID_SIZE])[(GRID_SIZE*y)+til GRID_SIZE]
          }

missing_vals: {$[GRID_SIZE=count x;
                 :DIGITS[where not DIGITS in raze x];
                 :DIGITS[where not DIGITS in x]
                ]
              }

