
home_path='/home/marc/'
usr_path='/usr/'

q_path=$home_path'q/l32/q'
rlwrap_path=$usr_path'bin/rlwrap'

src_path=$home_path'git/onid/q/src/'


$rlwrap_path -r $q_path $src_path'init.q' -c 30 2000i -p 5001 -log info
