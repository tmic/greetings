random_selection=`od --read-bytes=1  -i /dev/urandom -An -tu | head -n1`
revised_small_memes_list=__PLAYERS_LIST__

list_size=${#revised_small_memes_list[@]}
selection=$(($random_selection % $list_size))
meme_selection=${revised_small_memes_list[$selection]}
ddate
cal -3
fortune -s | cowsay -f ${meme_selection}
