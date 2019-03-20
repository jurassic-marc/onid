\l /home/marc/git/onid/q/src/src.q

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


test_is_last_cand_val_not_last: {ex:0b; ac:is_last_cand_val[(2;3;5);3]; :ex~ac}

test_is_last_cand_val_is_last: {ex:1b; ac:is_last_cand_val[(2;3;5);5]; :ex~ac}


test_is_row_complete_with_non_complete_row: {ex:0b; ac:is_row_complete[0,-8?1+til 9]; :ex~ac}

test_is_row_complete_with_complete_row: {ex:1b; ac:is_row_complete[-9?1+til 9]; :ex~ac}

test_is_row_complete_with_all_zeros: {ex:0b; ac:is_row_complete[9#0]; :ex~ac}


test_is_bt_row_needed_when_not: {ex:0b; ac:first is_bt_row_needed[test_9_by_9;7;5]; :ex~ac}

test_is_bt_row_needed_when_needed: {ex:1b; ac:first is_bt_row_needed[test_9_by_9;7;1]; :ex~ac}


test_get_rows_with_zero_with_puzzle_needing_solved: {}




get_rows_with_zero: {[b] :1+where any each 0=get_row[b;]each 1+til get_board_size[b][0]}

