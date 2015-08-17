#!/bin/bash

suffix() {
	if [ -z $1 ]; then
		print_suffix_usage
		return
	fi

	if [ -z $2 ]; then
		print_suffix_usage
		return
	fi

	if [ -z $3 ]; then
		print_suffix_usage
		return
	fi

	if [ ! -e $3 ]; then
		echo 'No such file or directory'
		return
	fi

	if [ -d $3 ]; then
		cd $3
		old_name=$1
		new_name=$2

		find ./ -name "*.${old_name}" | awk -F "." '{print $2}' | xargs -i -t mv ./{}.${old_name} ./{}.${new_name}

		cd - > /dev/null
	else
		echo "$3 is not a directory, why don't you use mv!"
	fi
}
function print_suffix_usage {

	echo  'Usage:'
	echo  'suffix <original> <new> <directory>'
}
