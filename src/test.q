/ \1 log/sys.out --stdout
/ \2 log/sys.err --stderr

/ \l /home/kdb+/git/log4q/log4q.q

\c 30 2000

/ \t 2000
/ .z.ts: {func(s) which is/are executed every 2000ms}

/ \d .sud

digits: 1+til 9

/board:  9 cut 81#0
/board: {9#x}each 1+til 9
/board: flip {9#x}each 1+til 9
/board: 9 cut 1+til 81
/
board: ({3#enlist raze {3#x} each 1+x+til 3}0),
       ({3#enlist raze {3#x} each 1+x+til 3}3),
        {3#enlist raze {3#x} each 1+x+til 3}6
\

board: ((0;0;0;0;0;0;0;0;3);(3;6;0;0;0;7;0;0;2);(0;2;0;5;0;6;1;8;0);
        (8;0;4;0;2;0;0;1;6);(0;7;0;0;1;0;0;4;0);(2;5;0;0;6;0;8;0;9);
        (0;9;2;8;0;3;0;7;0);(7;0;0;2;0;0;0;9;4);(1;0;0;0;0;0;0;0;0))

get_row: {board[x]}
get_col: {(flip board)[x]}

get_grid: {[g] x:floor((g-1)%3); y:(g-1)mod 3;
               flip(flip board[(3*x)+til 3])[(3*y)+til 3]}

missing_vals: {digits[where not digits in x]}

missing_pos: {where not x in digits}

/
go-to row, check for nulls
r: 1
missing_vals[get_row[r]] ==> 1 3 4 9  #for 1
missing_pos[get_row[r]]  ==> 1 3 7 8  #for 1

assign first viable (for now, all) ==> new_num: 1 @ c: 1

check for conflicts (c/g)
new_num in get_col[pos] ==> if 0b, check grid, else back one up
new_num in get_grid[
\

\d .
