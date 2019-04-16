\l /home/marc/git/onid/q/src/src.q
\l /home/marc/git/log4q/log4q.q

TEST_DIR: ":/home/marc/git/onid/q/test/";
TEST_DATA_DIR: TEST_DIR,"data/";

test_9_by_9: get `$TEST_DATA_DIR,"pre_defined_board";


test_get_board_size_with_9_by_9_board: {[b] ex:(9;9); ac:get_board_size[b]; :ex~ac}[test_9_by_9]


test_get_grid_size_with_9_by_9_board: {[b] ex:(3;3); ac:get_grid_size[b]; :ex~ac}[test_9_by_9]


test_get_digits_with_9_by_9_board: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:get_digits[b]; :ex~ac}[test_9_by_9]


test_get_row_with_valid_number: {[b] ex:(0;2;0;5;0;6;1;8;0); ac:get_row[b;3]; :ex~ac}[test_9_by_9]

test_get_row_with_negative_number: {[b] ex:(); ac:get_row[b;-1]; :ex~ac}[test_9_by_9]

test_get_row_with_out_of_range_number: {[b] ex:(); ac:get_row[b;12]; :ex~ac}[test_9_by_9]


test_get_col_with_valid_number: {[b] ex:(0;7;6;0;0;0;3;0;7); ac:get_col[b;6]; :ex~ac}[test_9_by_9]

test_get_col_with_negative_number: {[b] ex:(); ac:get_col[b;-4]; :ex~ac}[test_9_by_9]

test_get_col_with_out_of_range_number: {[b] ex:(); ac:get_col[b;11]; :ex~ac}[test_9_by_9]


test_get_grid_by_grid_number_with_valid_number: {[b] ex:((0;2;0);(0;1;0);(0;6;0)); ac:get_grid_by_grid_number[b;5]; :ex~ac}[test_9_by_9]

test_get_grid_by_grid_number_with_negative_number: {[b] ex:(); ac:get_grid_by_grid_number[b;-2]; :ex~ac}[test_9_by_9]

test_get_grid_by_grid_number_with_out_of_range_number: {[b] ex:(); ac:get_grid_by_grid_number[b;22]; :ex~ac}[test_9_by_9]


test_get_grid_by_row_col_with_valid_co_ords: {[b] ex:((0;9;2);(7;0;0);(9;1;2)); ac:get_grid_by_row_col[(7;1)]; :ex~ac}[test_9_by_9]

test_get_grid_by_row_col_with_negtive_co_ords: {[b] ex:(); ac:get_grid_by_row_col[(7;-1)]; :ex~ac}[test_9_by_9]

test_get_grid_by_row_col_with_out_of_range_co_ords: {[b] ex:(); ac:get_grid_by_row_col[(12;3)]; :ex~ac}[test_9_by_9]


test_get_grid_with_grid_value: {[b] ex:((0;0;0);(0;0;1);(9;0;6)); ac:get_grid[b;2]; :ac~ex}[test_9_by_9]

test_get_grid_with_co_ords: {[b] ex:((804);(070);(250)); ac:get_grid[b;(2;4)]}[test_9_by_9]


test_missing_vals_with_row: {[b] ex:(3;5;7;9); ac:missing_vals[b;get_row[b;4]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_col: {[b] ex:(3;4;5;7;8;9); ac:missing_vals[b;get_col[b;5]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_grid: {[b] ex:(1;4;5;7;8;9); ac:missing_vals[b;get_grid[b;1]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_all_missing: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:missing_vals[b;get_row[b;1]]; :ex~ac}[test_9_by_9]

test_missing_vals_with_none_missing: {[b] ex:`long$(); ac:missing_vals[b;get_row[b;9]]; :ex~ac}[test_9_by_9]


test_missing_pos_with_row: {[b] ex:(3;4;5;7;8); ac:missing_pos[b;get_row[b;2]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_col: {[b] ex:(1;2;4;5;6); ac:missing_pos[b;get_col[b;4]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_grid: {[b] ex:(1;3;5;7;9); ac:missing_pos[b;get_grid[b;4]]; :ex~ac}[test_9_by_9]

test_missing_pos_with_all_missing: {[b] ex:(1;2;3;4;5;6;7;8;9); ac:missing_pos[b;9#0]; :ex~ac}[test_9_by_9]

test_missing_pos_with_none_missing: {[b] ex:`long$(); ac:missing_pos[b;-9?1+til 9]; :ex~ac}[test_9_by_9]


test_is_conflict_with_existing_val_in_row_or_col: {[b] ex:1b; ac:is_conflict[4;3;get_grid[b;(4;3)];8]; :ex~ac}[test_9_by_9]

test_is_conflict_with_existing_val_in_grid: {[b] ex:1b; ac:is_conflict[2;4;get_grid[b;(2;4)];5]; :ex~ac}[test_9_by_9]

test_is_conflict_no_existing_val_in_grid_or_col: {[b] ex:0b; ac:is_conflict[1;2;get_grid[b;(1;2)];4]; :ex~ac}[test_9_by_9]

test_next_val_in_list_larger: {ex:5; ac:next_val_in_list[3;(2;3;5);`p]; :ex~ac}

test_next_val_in_list_largest: {ex:0N; ac:next_val_in_list[5;(2;3;5);`p]; :ex~ac}

test_next_val_in_list_smaller: {ex:2; ac:next_val_in_list[3;(2;3;5);`n]; :ex~ac}

test_next_val_in_list_smallest: {ex:0N; ac:next_val_in_list[2;(2;3;5);`n]; :ex~ac}


test_is_cand_val_invalid_not_invalid: {ex:0b; ac:is_cand_val_invalid[3]; :ex~ac}

test_is_cand_val_invalid_invalid: {ex:1b; ac:is_cand_val_invalid[0N]; :ex~ac}


test_is_last_cand_val_not_last: {ex:0b; ac:is_last_cand_val[(2;3;5);3]; :ex~ac}

test_is_last_cand_val_is_last: {ex:1b; ac:is_last_cand_val[(2;3;5);5]; :ex~ac}


test_is_init_board_invalid_not_invalid: {[b] ex:0b; ac:is_init_board_invalid[b]; :ex~ac}[test_9_by_9]

test_is_init_board_invalid_is_invalid_dupe_row: {[b] ex:1b; ac:is_init_board_invalid[b]; :ex~ac}[(enlist 2,((7#0),2)),8#enlist (9#0)]

test_is_init_board_invalid_is_invalid_dupe_col: {[b] ex:1b; ac:is_init_board_invalid[b]; :ex~ac}[flip (enlist 4,(7#0),4),8#enlist (9#0)]

test_is_init_board_invalid_is_invalid_dupe_grid: {[b] ex:1b; ac:is_init_board_invalid[b]; :ex~ac}[(enlist 0,3,(7#0)),(enlist 9#0),(enlist 3,8#0),6#enlist (9#0)]


test_is_row_complete_with_non_complete_row: {[r] ex:0b; ac:is_row_complete[r]; :ex~ac}[0,-8?1+til 9]

test_is_row_complete_with_complete_row: {[r] ex:1b; ac:is_row_complete[r]; :ex~ac}[-9?1+til 9]

test_is_row_complete_with_all_zeros: {[r] ex:0b; ac:is_row_complete[r]; :ex~ac}[9#0]


test_is_bt_row_needed_when_not: {[b] ex:0b; ac:first is_bt_row_needed[b;7;5]; :ex~ac}[test_9_by_9]

test_is_bt_row_needed_when_needed: {[b] ex:1b; ac:first is_bt_row_needed[b;7;1]; :ex~ac}[test_9_by_9]


test_get_rows_with_zero_with_unsolved_puzzle: {[b] ex:(1;2;3;4;5;6;8); ac:get_rows_with_zero[b]; :ex~ac}[test_9_by_9]

test_get_rows_with_zero_with_solved_puzzle: {[b] ex:(); ac:get_rows_with_zero[b]; :ex~ac}[9# enlist -9?1+til 9]


test_get_row_start_row_4: {[b] ex:3; ac:get_row_start[b;get_row[b;4]]; :ex~ac}[test_9_by_9]


test_is_board_complete_when_not: {[b] ex:(0b;4); ac:is_board_complete[b;(1;2;3;4);3]; :ex~ac}[test_9_by_9]

test_is_board_complete_when_is: {[b] ex:(1b;()); ac:is_board_complete[b;(1;2;3;4);4]; :ex~ac}[test_9_by_9]


test_is_board_invalid_not_invalid: {[b] ex:0b; ac:is_board_invalid[b;2;5]; :ex~ac}[test_9_by_9]

test_is_board_invalid_is_invalid: {[b] ex:0b; ac:is_board_invalid[b;2;1]; :ex~ac}[test_9_by_9]


test_terminate_when_solved_board: {[b] ex:(1b;b); ac:terminate[b;1b;{reverse reverse}]; :ex~ac}[test_9_by_9]

test_terminate_when_unsolved_board: {[b] ex:(0b;b); ac:terminate[b;0b;{reverse reverse}]; :ex~ac}[test_9_by_9]


try_again: {[b;r;c;cand_r;cand_v;v_s;c_s;mnip_r]
            $[is_last_cand_val[cand_v;v_s];
              :`bt;
              :`init;
             ];
           }


test_try_again_calling_init: {[b;r;c;cand_v;mnip_r] cand_r: get_row[b;r]; 
                  v_s: missing_vals[b;cand_r]; c_s: missing_pos[b;cand_r];
                  ex:`init; ac:try_again[b;r;c;cand_r;cand_v;v_s;c_s;mnip_r]; :ex~ac}[(enlist 9#0),(enlist 1,8#0),7#(enlist 9#0);1;1;1;{reverse reverse}]

test_try_again_calling_bt: {[b;r;c;cand_v;mnip_r] cand_r: get_row[b;r];
                  v_s: missing_vals[b;cand_r]; c_s: missing_pos[b;cand_r]; 
                  ex:`bt; ac:try_again[b;r;c;cand_r;cand_v;v_s;c_s;mnip_r]; :ex~ac}[(enlist 9#0),(enlist 9,8#0),7#(enlist 9#0);1;1;9;{reverse reverse}]


try_next: {[b;r_s;c_s;r;c;cand_r;cand_v;mnip_r]
           b[r-1]:cand_r;

           $[is_row_complete[cand_r];
             (c:get_row_start[b;cand_r]; cand_r:get_row[b;r]; r:last cond
              if[first cond:is_board_complete[b;r_s;r]; :terminate[b;1b;mnip_r]]
             );
             c:next_val_in_list[c;c_s;`p]
            ];

           :(r;c);
          }


test_try_next_when_row_not_complete: {[b;r;c;cand_v;mnip_r] 
                     r_s: get_rows_with_zero[b]; cand_r: get_row[b;r]; 
                     c_s: missing_pos[b;cand_r];
                     ex: (1;9); ac:try_next[b;r_s;c_s;r;c;cand_r;cand_v;mnip_d];
                     :ex~ac;
                    }[(enlist (1+til 7),2#0),8#(enlist 9#0);1;8;8;{reverse reverse}]

test_try_next_when_row_complete: {[b;r;c;cand_v;mnip_r] 
                     r_s: get_rows_with_zero[b]; cand_r: get_row[b;r]; 
                     c_s: missing_pos[b;cand_r]; 
                     ex: (2;1); ac:try_next[b;r_s;c_s;r;c;cand_r;cand_v;mnip_d];
                     :ex~ac;
                    }[(enlist (1+til 8),0),8#(enlist 9#0);1;9;9;{reverse reverse}]


init: {[b;r;c;cand_r;v_s;c_s;mnip_r]
       if[is_cand_val_invalid[cand_v:next_val_in_list[cand_r[c-1];v_s;`p]];
                              :`bt;
         ];

       cand_r[c-1]:cand_v;
       $[is_conflict[get_row[b;r];get_col[b;c];get_grid[b;(r;c)];cand_v];
         :`try_again;
         :`try_next
        ];
      }


test_init_when_bt_is_called: {[b;r;c;mnip_r] cand_r:get_row[b;r]; 
                   v_s: missing_vals[b;cand_r]; c_s: missing_pos[b;cand_r];
                   ex:`bt; ac:init[b;r;c;cand_r;v_s;c_s;mnip_r];
                   :ex~ac;
                  }[(enlist (1+til 7),9,0),8#(enlist 9#0);1;8;{reverse reverse}]

test_init_when_try_again_is_called: {[b;r;c;mnip_r] cand_r:get_row[b;r];
                   v_s: missing_vals[b;cand_r]; c_s: missing_pos[b;cand_r];
                   ex:`try_again; ac:init[b;r;c;cand_r;v_s;c_s;mnip_r];
                   :ex~ac;
                  }[(enlist (1+til 8),0),(enlist (7#0),8,0),7#(enlist 9#0);1;8;{reverse reverse}]

test_init_when_try_next_is_called: {[b;r;c;mnip_r] cand_r:get_row[b;r];
                   v_s: missing_vals[b;cand_r]; c_s: missing_pos[b;cand_r];
                   ex:`try_next; ac:init[b;r;c;cand_r;v_s;c_s;mnip_r];
                   :ex~ac;
                  }[(enlist (1+til 8),0),8#(enlist 9#0);1;8;{reverse reverse}]


solve_board: {[b;mnip_r] board::b;
              if[is_init_board_invalid[b]; :`terminate];
              r_s:get_rows_with_zero[b]; r:r_s[0]; cand_r:get_row[b;r];
              v_s:missing_vals[b;cand_r]; c_s:missing_pos[b;cand_r];
              :`init
             }


test_solve_board_when_init_board_is_invalid: {[b;mnip_r]
                             ex:`terminate; ac:solve_board[b;mnip_r];
                             :ex~ac;
                             }[(enlist (1+til 7),2#9),8#(enlist 9#0);{reverse reverse}]

test_solve_board_when_init_board_is_not_invalid: {[b;mnip_r]
                             ex:`init; ac:solve_board[b;mnip_r];
                             :ex~ac;
                             }[(enlist (1+til 9),8#(enlist 9#0);{reverse reverse}]
