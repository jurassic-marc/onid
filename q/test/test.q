
TEST_DIR: ":/home/marc/git/onid/test/";
TEST_DATA_DIR: TEST_DIR,"data/";

test_9_by_9: get `$TEST_DATA_DIR,"pre_defined_board";


get_board_size: {[b] :`long$(count b;first count b)}


test_get_board_size_with_9_by_9_board: {[b] ex:(9;9); ac:get_board_size[b]; :ex~ac}[test_9_by_9]


get_grid_size: {[b] :`long$sqrt each get_board_size[b]}


test_get_grid_size_with_9_by_9_board: {[b] ex:(3;3); ac:get_grid_size[b]; :ex~ac}[test_9_by_9]


get_digits: {[b] :1+til first get_board_size[b]}


test_get_digits_with_9_by_9_board: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:get_digits[b]; :ex~ac}[test_9_by_9]


get_row: {[b;r] :b[r-1]}


test_get_row_with_valid_number: {[b] ex:(0;2;0;5;0;6;1;8;0); ac:get_row[b;3]; :ex~ac}[test_9_by_9]

test_get_row_with_negative_number: {[b] ex:(); ac:get_row[b;-1]; :ex~ac}[test_9_by_9]

test_get_row_with_out_of_range_number: {[b] ex:(); ac:get_row[b;12]; :ex~ac}[test_9_by_9]


get_col: {[b;c] :(flip b)[c-1]}


test_get_col_with_valid_number: {[b] ex:(0;7;6;0;0;0;3;0;7); ac:get_col[b;6]; :ex~ac}[test_9_by_9]

test_get_col_with_negative_number: {[b] ex:(); ac:get_col[b;-4]; :ex~ac}[test_9_by_9]

test_get_col_with_out_of_range_number: {[b] ex:(); ac:get_col[b;11]; :ex~ac}[test_9_by_9]


get_grid_by_grid_number: {[b;g] r:floor(g-1)%r_size:(get_grid_size[b])[0];
                                c:(g-1)mod c_size:(get_grid_size[b])[1];
                                :flip(flip b[(r_size*r)+til r_size])[(c_size*c)+til c_size]
                         }



test_get_grid_by_grid_number_with_valid_number: {[b] ex:((0;2;0);(0;1;0);(0;6;0)); ac:get_grid_by_grid_number[b;5]; :ex~ac}[test_9_by_9]

test_get_grid_by_grid_number_with_negative_number: {[b] ex:(); ac:get_grid_by_grid_number[b;-2]; :ex~ac}[test_9_by_9]

test_get_grid_by_grid_number_with_out_of_range_number: {[b] ex:(); ac:get_grid_by_grid_number[b;22]; :ex~ac}[test_9_by_9]


get_grid_by_row_col: {[b;co_ord] r:co_ord[0]-1; c:co_ord[1]-1; g_s:get_grid_size[b];
                                 r:1+g_s[0]*floor(r)%g_s[0]; c:floor(c)%g_s[1];
                                 :get_grid_by_grid_number[b;r+c]
                     }


test_get_grid_by_row_col_with_valid_co_ords: {[b] ex:((0;9;2);(7;0;0);(9;1;2)); ac:get_grid_by_row_col[(7;1)]; :ex~ac}[test_9_by_9]

test_get_grid_by_row_col_with_negtive_co_ords: {[b] ex:(); ac:get_grid_by_row_col[(7;-1)]; :ex~ac}[test_9_by_9]

test_get_grid_by_row_col_with_out_of_range_co_ords: {[b] ex:(); ac:get_grid_by_row_col[(12;3)]; :ex~ac}[test_9_by_9]


get_grid: {[b;x] $[1=count x;
                   get_grid_by_grid_number[b;x];
                   get_grid_by_row_col[b;x]
                  ]}


missing_vals: {[b;x] digits: get_digits[b];
                     $[get_grid_size[b][0]=count x;
                       :digits[where not digits in raze x];
                       :digits[where not digits in x]
                      ]
              }

test_missing_vals_with_row: {[b] ex:(3;5;7;9); ac:missing_vals[b;get_row[b;4]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_col: {[b] ex:(3;4;5;7;8;9); ac:missing_vals[b;get_col[b;5]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_grid: {[b] ex:(1;4;5;7;8;9); ac:missing_vals[b;get_grid[b;1]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_all_missing: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:missing_vals[b;get_row[b;1]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_none_missing: {[b] ex:`long$(); ac:missing_vals[b;get_row[b;9]]; :ex~ac}[test_9_by_9]


missing_pos: {[b;x] digits: get_digits[b];
                    $[get_grid_size[b][0]=count x;
                      :1+where not (raze x) in digits;
                      :1+where not x in digits
                     ]
             }


test_missing_pos_with_row: {[b] ex:(3;4;5;7;8); ac:missing_pos[b;get_row[b;2]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_col: {[b] ex:(1;2;4;5;6); ac:missing_pos[b;get_col[b;4]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_grid: {[b] ex:(1;3;5;7;9); ac:missing_pos[b;get_grid[b;4]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_all_missing: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:missing_pos[b;get_row[b;1]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_none_missing: {[b] ex:`long$(); ac:missing_pos[b;get_row[b;9]]; :ex~ac}[test_9_by_9]


is_conflict: {[r;c;g;v] $[(v in r)|(v in c)|v in raze g; :1b; :0b]}


test_is_conflict_existing_val_in_row_or_col: {board:: test_9_by_9;
                                              r:get_row[board;4]; c:get_row[board;4]; ex:1b; ac:is_conflict[r;c;get_grid[board;(r;c)];8]; :ex~ac
                                      }

test_is_conflict_existing_val_in_grid: {board:: test_9_by_9;
                                        r:get_row[board;2]; c:get_row[board;4];
                                        ex:1b; ac:is_conflict[r;c;get_grid[board;(r;c)];5]; :ex~ac
                                      }

test_is_conflict_no_existing_val_in_grid_or_col: {board:: test_9_by_9;
                                                  r:get_row[board;1]; c:get_col[board;2];
                                                  ex:0b; ac:is_conflict[r;c;get_grid[board;(r;c)];4]; :ex~ac
                                      }
