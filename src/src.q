\c 30 2000

BOARD_SIZE: `int$9;
 GRID_SIZE: `int$sqrt BOARD_SIZE;  //3
    DIGITS: 1+til BOARD_SIZE;

board: ((7;8;1;3;4;5;2;9;6);(0;0;0;1;2;6;5;8;7);(6;2;5;8;7;9;1;4;3);
        (5;6;7;2;8;4;3;1;9);(8;1;9;5;3;7;4;6;2);(4;3;2;6;9;1;8;7;5);
        (0;5;6;7;1;8;9;2;4);(2;9;8;4;6;3;7;5;1);(1;7;4;9;5;2;6;3;8))


get_row: {board[x-1]}
get_col: {(flip board)[x-1]}

get_grid: {$[1=count x; get_grid_by_grid_number[x]; get_grid_by_row_col[x]]}

get_grid_by_grid_number: {[g] x:floor((g-1)%GRID_SIZE); y:(g-1)mod GRID_SIZE;
                              :flip(flip board[(GRID_SIZE*x)+til GRID_SIZE])[(GRID_SIZE*y)+til GRID_SIZE]
                         }

get_grid_by_row_col: {r:x 0; c:x 1; r:1+3*floor((r-1)%3); c:floor((c-1)%3);
                      :get_grid_by_grid_number[r+c]
                     }

missing_vals: {$[GRID_SIZE=count x;
                 :DIGITS[where not DIGITS in raze x];
                 :DIGITS[where not DIGITS in x]
                ]
              }

missing_pos: {$[GRID_SIZE=count x;
                :1+where not (raze x) in DIGITS;
                :1+where not x in DIGITS
               ]
             }

is_conflict: {[v;r;c] if[v in get_col[c]; :1b];
                      if[v in raze get_grid[(r;c)]; :1b];
                      :0b
             }

