#!/usr/bin/env bash

max_height=30
if ! [[ -z $1 ]] 
then 
	max_height=$1 
fi

if ! [[ -d review ]]
then
	mkdir review
fi

rm -f review/*

actors=()
cowsay_data=`cowsay -l`
lines=0
while read line
do
	(( lines++ ))
	# First line displays the path of the actors files.
	# In case implementation changes, not going to access the files directly, 
	# but run the program with each actor with predefined text.
	if [[ ${lines} == 1 ]] 
	then
		continue
	fi

	actors_in_line=($line)
	for actor in "${actors_in_line[@]}"
	do
		echo hello | cowsay -f ${actor} > review/${actor}
		height=`wc -l < review/${actor}`
		if [[ ${height} -le ${max_height} ]]
		then
			actors+=(${actor})
		else
			rm review/${actor}
		fi

	done
	#echo ${actors[@]}
done <<< ${cowsay_data}


array_text=`printf "\"%s\" " ${actors[@]}`
array_format=`echo "( ${array_text} )"`


cp greeting_template.sh greetings.sh
sed -i "s/__PLAYERS_LIST__/${array_format}/" greetings.sh

