
TEST_DIR: ":/home/marc/git/onid/test/";
TEST_DATA_DIR: TEST_DIR,"data/";

BOARD_SIZE: `int$9;
 GRID_SIZE: `int$sqrt BOARD_SIZE;
    DIGITS: 1+til BOARD_SIZE;

board: ();

   test_grid: get `$TEST_DATA_DIR,"grid_board";
    test_row: get `$TEST_DATA_DIR,"row_board";
    test_col: get `$TEST_DATA_DIR,"col_board";
test_pre_def: get `$TEST_DATA_DIR,"pre_defined_board";

 
get_grid_by_grid_number: {[g] x:floor((g-1)%GRID_SIZE); y:(g-1)mod GRID_SIZE;
                              flip(flip board[(GRID_SIZE*x)+til GRID_SIZE])[(GRID_SIZE*y)+til GRID_SIZE]
                         }

test_get_grid_by_grid_number_valid_val: {board:: test_grid; 
                                         ex: GRID_SIZE#enlist GRID_SIZE#5; ac: get_grid[5]; :ex~ac
                                        }

test_get_grid_by_grid_number_invalid_val: {board:: test_grid; 
                                           ex: (); ac: get_grid[0]; :ex~ac
                                          }

get_grid_by_row_col: {r:x 0; c:x 1; r:1+3*floor((r-1)%3); c:floor((col-1)%3);
                      :get_grid_by_grid_number[r+c]
                     }

test_get_grid_by_row_col: {board:: test_grid;
                           ex: GRID_SIZE#enlist GRID_SIZE#8; ac: get_grid_by_row_col[(8;5)]; :ex~ac
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


missing_vals: {$[GRID_SIZE=count x;
                 :DIGITS[where not DIGITS in raze x];
                 :DIGITS[where not DIGITS in x]
                ]
              }

test_missing_vals_row_col: {board:: test_pre_def; 
                            ex: ((3;5;7;9);(1;2;4;5;8;9)); ac: (missing_vals[get_row[4]]; missing_vals[get_col[6]]); :ex~ac
                           }

test_missing_vals_grid: {board:: test_pre_def; 
                         ex: (3;4;5;7;8;9); ac: missing_vals[get_grid[5]]; :ex~ac
                        }

test_all_missing_vals: {board:: test_pre_def; 
                        ex: 1+til BOARD_SIZE; ac: missing_vals[get_row[1]]; :ex~ac
                       }

test_no_missing_vals: {board:: test_pre_def; 
                       ex: `long$(); ac: missing_vals[get_row[9]]; :ex~ac
                      }


missing_pos: {$[GRID_SIZE=count x;
                :1+where not (raze x) in DIGITS;
                :1+where not x in DIGITS
               ]
             }


test_missing_pos_row_col: {board:: test_pre_def; 
                           ex: ((3;4;6;8);(1;4;8)); ac: (missing_pos[get_row[6]]; missing_pos[get_col[2]]); :ex~ac
                          }

test_missing_pos_grid: {board:: test_pre_def; 
                        ex: (2;4;6;9); ac: missing_pos[get_grid[4]]; :ex~ac
                       }

test_all_missing_pos: {board:: test_pre_def; 
                       ex: 1+til BOARD_SIZE; ac: missing_pos[get_row[1]]; :ex~ac
                      }

test_no_missing_pos: {board:: test_pre_def; 
                      ex: `long$(); ac: missing_pos[get_row[9]]; :ex~ac
                     }


is_conflict: {[v;r;c] if[v in get_col[c]; :1b];
                      if[v in raze get_grid[(r;c)]; :1b];
                      :0b
             }

test_is_conflict_existing_val_in_row: {board:: test_pre_def;
                                       ex: 1b; ac: is_conflict[4;2;3]; :ex~ac
                                      }

test_is_conflict_existing_val_in_grid: {board:: test_pre_def;
                                        ex: 1b; ac: is_conflict[2;2;3]; :ex~ac
                                      }

test_is_conflict_no_existing_val_in_grid_or_col: {board:: test_pre_def;
                                                  ex: 0b; ac: is_conflict[1;2;3]; :ex~ac
                                      }

