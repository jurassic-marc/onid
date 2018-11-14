
TEST_DIR: ":/home/marc/git/onid/test/";
TEST_DATA_DIR: TEST_DIR,"data/";

BOARD_SIZE: `int$9;
 GRID_SIZE: `int$sqrt BOARD_SIZE;

board: ();

   test_grid: get `$TEST_DATA_DIR,"grid_board";
    test_row: get `$TEST_DATA_DIR,"row_board";
    test_col: get `$TEST_DATA_DIR,"col_board";

get_grid: {[g] x:floor((g-1)%GRID_SIZE); y:(g-1)mod GRID_SIZE;
               flip(flip board[(GRID_SIZE*x)+til GRID_SIZE])[(GRID_SIZE*y)+til GRID_SIZE]
          }

test_get_grid_valid_val:   {board:: test_grid; 
                            ex: GRID_SIZE#enlist GRID_SIZE#5; ac: get_grid[5]; :ex~ac
                           }

test_get_grid_invalid_val: {board:: test_grid; 
                            ex: (); ac: get_grid[0]; :ex~ac
                           }

get_row: {board[x-1]}

test_get_row_valid_val:   {board:: test_row;
                           ex: BOARD_SIZE#3; ac: get_row[3]; :ex~ac
                          }

test_get_row_invalid_val: {board:: test_row;
                           ex: `long$(); ac: get_row[-1]; :ex~ac
                          }

get_col: {(flip board)[x-1]}

test_get_col_valid_val:   {board:: test_col;
                           ex: BOARD_SIZE#7; ac: get_col[7]; :ex~ac
                          }

test_get_col_invalid_val: {board:: test_col;
                           ex: `long$(); ac: get_col[-2]; :ex~ac
                          }
