\c 30 2000

board: ((0;0;0;0;0;5;0;0;0);(2;5;1;0;0;0;4;6;0);(0;0;0;4;0;0;1;3;5);
        (5;1;2;0;6;0;0;7;4);(0;0;6;0;8;0;9;0;0);(8;4;0;0;7;0;3;5;6);
        (1;8;7;0;0;3;0;0;0);(0;3;5;0;0;0;7;1;9);(0;0;0;1;0;0;0;0;0))


test_log: {[iss;r;v;c] show (`$string(iss)), (`$string(r),":"), (`$string(v)),
                       (`$"@"), `$string(c)
          }

/
get_board_size - function which returns the board size from the given board

@param b: list of listed numbers representing the board

@returns: list of two numbers representing the board's row and column sizes

@example: get_grid_size[9 cut 1+til 81]
\


get_board_size: {[b] :`long$(count b;first count b)}


/
get_grid_size - function which returns the grid size from the given board

@param b: list of listed numbers representing the board

@returns: list of two numbers representing the grid's row and column sizes

@example: get_grid_size[9 cut 1+til 81]
\


get_grid_size: {[b] :`long$sqrt each get_board_size[b]}


/
get_digits - function which returns the Sudoku values for a given board

@param b: list of listed numbers representing the board

@returns: list of numbers representing the valid Sudoku values for the board

@example: get_digits[9 cut 1+til 81]
\


get_digits: {[b] :1+til first get_board_size[b]}


/
get_row - function which takes a number atom and returns that row from the board

@param b: list of listed numbers representing the board
@param r: atom number representing the row number

@returns: list of numbers which is the row

@example: get_row[9 cut 1+til 81;4]
\


get_row: {[b;r] :b[r-1]}


/
get_col - function which takes a number atom and returns that column from the board

@param b: list of listed numbers representing the board
@param c: atom number representing the column number

@returns: list of numbers which is the column

@example: get_col[9 cut 1+til 81;8]
\


get_col: {[b;c] :(flip b)[c-1]}


/
get_grid - function which decides which function to call to get the grid depending on the input

@param b: list of listed numbers representing the board
@param x: atom number which is the grid number
          list of two numbers which is an x,y co-ord

@returns: list of listed numbers which is a grid

@example: get_grid[3]
@example: get_grid[(2;8)]
\


get_grid: {[b;x] $[1=count x; 
                   get_grid_by_grid_number[b;x];
                   get_grid_by_row_col[b;x]
                  ]}


/
get_grid_by_grid_number - function which returns the grid specified by the its grid number

@param b: list of listed numbers representing the board
@param g: atom number which is the grid number

@returns: list of listed numbers which is a grid

@example: get_grid_by_grid_number[9 cut 1+til 81;7]
\


get_grid_by_grid_number: {[b;g] r:floor(g-1)%r_size:get_grid_size[b][0]; 
                                c:(g-1)mod c_size:get_grid_size[b][1];
                                :flip(flip b[(r_size*r)+til r_size])[(c_size*c)+til c_size]
                         }


/
get_grid_by_row_col - function which returns the grid that the specified x,y co-ord is contaned in

@param b: list of listed numbers representing the board
@param x: list of two numbers which is the x and y co-ord

@returns: list of listed numbers which is a grid

@example: get_grid_by_row_col[9 cut 1+til 81;(5;8)]
\


get_grid_by_row_col: {[b;co_ord] r:co_ord[0]-1; c:co_ord[1]-1; g_s:get_grid_size[b];
                                 r:1+g_s[0]*floor(r)%g_s[0]; c:floor(c)%g_s[1];
                                 :get_grid_by_grid_number[b;r+c]
                     }

/
missing_vals - function which returns the missing Sudoku values from an inputed list

@param b: list of listed numbers representing the board
@param x: list of numbers representing the row or column
          list of listed numbers representing the grid

@returns: list of numbers which are the missing Sudoku values for the input

@example: missing_vals(9 cut 1+til 81;(3;0;8;7;1;2;0;0;5))
@example: missing_vals(9 cut 1+til 81;(7;0;9);(0;0;1);(5;4;0))
\


missing_vals: {[b;x] digits: get_digits[b];
                     $[get_grid_size[b][0]=count x;
                       :digits[where not digits in raze x];
                       :digits[where not digits in x]
                      ]
              }
 

/
missing_pos - function which returns the position of the missing Sudoku values from an inputed list

@param b: list of listed numbers representing the board
@param x: list of numbers representing the row or column
          list of listed numbers representing the grid

@returns: list of numbers which are the positions of the missing Sudoku values for the input

@example: missing_pos(9 cut 1+til 81;(3;0;8;7;1;2;0;0;5))
@example: missing_pos(9 cut 1+til 81;(7;0;9);(0;0;1);(5;4;0))
\


missing_pos: {[b;x] digits: get_digits[b];
                    $[(count x)=(get_grid_size[b])[0];
                      :1+where not (raze x) in digits;
                      :1+where not x in digits
                     ]
             }


/
is_conflict - function which returns a boolean determining if the value is allowable in the cell

@param r: list of numbers representing the row
@param c: list of numbers representing the column
@param g: list of listed numbers representing the grid
@param v: atom number representing the value in question

@retuns: boolean whether the value is contained within the row, column or grid at that position

@example: is_conflict[get_row[board;5];get_col[board;3];get_grid[board;4];7]
\


is_conflict: {[r;c;g;v] $[(v in r)|(v in c)|v in raze g; :1b; :0b]}


/
next_val_in_list - function which returns the next largest value in a list in comparison to the value given

@param v: atom number which is the value under consideration
@param l: list of numbers which represents the number pool
@param m: symbol denoting wether it is next largest or smallest value to be returrned

@returns: the first value either side of the value given
          0N if none exist

@example: next_val_in_list[3;(1;3;5);`p]
@example: next_val_in_list[5;(1;3;5);`n]
\

next_val_in_list: {[v;l;m] if[m=`p; :l[first where l>v]];
                           if[m=`n; :l[first where l<v]];
                  };


/
is_cand_val_invalid - function which determines whether the value is the last potential

@param cand_v: atom number which is the candidate value

@returns: whether the candidate value is the last for the row

@example: is_cand_val_invalid[8]
\


is_cand_val_invalid: {[cand_v] :(0N=cand_v)}


/
is_last_cand_val - function which returns a boolean determining if the inputted value is the last candidate value for the inputted list of numbers

@param x: list of numbers which are the candidate values for the cell
@param y: atom number which is under consideration

@returns: boolean whether the candidate value is the last value for consideration

@example: is_last_cand_val[(3;5;7);7]
\


is_last_cand_val: {:all x >= y}


/
is_row_complete - function which determines whether the row is solved

@param r: list of listed numbers representing the row

@returns: boolean whether the has any zeros

@example: is_row_complete[(3;2;1;7;6;9;0;8;4)]
\


is_row_complete: {[r] $[any r=0; :0b; :1b]}


/
is_row_invalid - function which determies whether the row is solveable with the current config

@param b: list of listed numbers representing the board
@param r: atom number representing the row number
@param c: atom number representing the column number

@returns: boolean whether the cell

@example: is_row_invalid[9 cut 1+til 81;3;8]
\


is_row_invalid: {[b;r;c] :(0N=1+last where 0=(c-1)#get_row[b;r];r_s[last where r>r_s:get_rows_with_zero[b]])
                }


/
get_rows_with_zero - function which gets the rows of the inputted board needing to be solved

@param b: list of listed numbers representing the board

@returns: list of numbers which are the row numbers to be solved

@example: get_rows_with_zero[9 cut 1+til 81]
\


get_rows_with_zero: {[b] :1+where any each 0=get_row[b;]each 1+til get_board_size[b][0]}


/
next_row_start - function which returns the column number of the first null value for the row

@param b: list of listed values representing the board
@param r: atom number representing the row number

@returns: atom number which is the column value of the first zero for the row
\


next_row_start: {[b;r] :missing_pos[b;r][0]}


/
is_board_complete - function which determines whether the board is solved

@param b: list of listed numbers representing the board
@param r_s: list of numbers which is the rows needing solved
@param r: list of numbers representing the row

@returns: whether the board is complete and the next row

@example: is_board_complete[9 cut 1+til 81;(6;7;8;9);7]
@example: is_board_complete[9 cut 1+til 81;(6;7;8;9);9]
\


is_board_complete: {[b;r_s;r] $[r=last r_s; :(1b;()); :(0b;next_val_in_list[r;r_s;`p])]}


/
is_board_invalid - function which determines whether the board is unsolveable

@param b: list of listed numbers representing the board
@param r: atom number representing the row number
@param c: atom number representing the column number

@returns: boolean which states whether the board is unsolveable

@example: is_board_invalid[9 cut 1+til 81;2;1]
\


is_board_invalid: {[b;r;c] :(c=min 1+where 0=get_row[b;r])&r=min 1+get_row[b;r]where any each 0=get_row[b;]each 1+til first get_board_size[b]
                  }

/


terminate - function which stops operation and displays the board given to it

@param b: list of listed values representing the board

@returns: show board

@example: terminate[9 cut 1+til 81]
\


terminate: {[b] show "-------------------------------"; :show b}


try_again: {[b;r;c;cand_r;cand_v;v_s;c_s] 
             test_log[`con;r;cand_v;c];

             $[is_last_cand_val[cand_v;v_s];
               :bt[b;r;c;cand_r;v_s;c_s];
               :ft[b;r;c;cand_r;v_s;c_s]
              ];
           }


try_next: {[b;r_s;c_s;r;c;cand_r;cand_v]
           test_log[`no_con;r;cand_v;c];
           b[r-1]:cand_r;

           $[is_row_complete[cand_r];
             (c:next_row_start[b;cand_r]; cand_r:get_row[b;r]; r:last cond
              if[first cond:is_board_complete[b;r_s;r]; :terminate[b]]
             );
             c:next_val_in_list[c;c_s;`p]
            ];

           :ft[b;r;c;cand_r;missing_vals[b;cand_r];missing_pos[b;cand_r]];
          }


ft: {[b;r;c;cand_r;v_s;c_s] cand_v:next_val_in_list[cand_r[c-1];v_s;`p];
                            cand_r[c-1]:cand_v;
                            
                            $[is_conflict[get_row[b;r];get_col[b;c];get_grid[b;(r;c)];cand_v];
                             try_again[b;r;c;cand_r;cand_v;v_s;c_s];
                             try_next[b;get_rows_with_zero[board];c_s;r;c;cand_r;cand_v]
                            ];
   }

bt: {[b;r;c;cand_r;v_s;c_s] if[is_board_invalid[board;r;c]; terminate[b]];
                            
                            if[first cond:is_row_invalid[board;r;c];
                               b[r-1]:board[r-1];
                               r:last cond;
                               :bt_row[board;b;r]
                              ];

                            test_log[`bt;r;last v_s;c];
                            cand_r[c-1]:0; b[r-1;c-1]:0;
                            v_s:missing_vals[b;cand_r];
                            all_c:missing_pos[board;get_row[board;r]];
                            cand_c:missing_pos[b;cand_r];
                            c_s:all_c[(-1+min i),i:where all_c in cand_c];
                            c:min c_s;
                            :ft[b;r;c;cand_r;v_s;c_s]
    }

