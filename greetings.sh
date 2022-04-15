random_selection=`od --read-bytes=1 -i /dev/urandom | head -n1 | awk '{print $2}'`
revised_small_memes_list=("apt" "bud-frogs" "bunny" "cock" "cower" "default" "duck" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "fox" "hellokitty" "koala" "luke-koala" "moofasa" "moose" "pony-smaller" "sheep" "skeleton" "suse" "three-eyes" "tux" "unipony-smaller" "vader" "vader-koala" "www")

list_size=${#revised_small_memes_list[@]}
selection_index=$((${random_selection} % ${list_size}))
meme_selection=${revised_small_memes_list[$selection_index]}
ddate && ncal -3 && fortune -s | cowsay -f ${meme_selection} 
