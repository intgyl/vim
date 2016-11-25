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
		echo "$3 No such file or directory"
		return
	fi

	if [ -d $3 ]; then
		old_name=$1
		new_name=$2

		for file2 in `ls $3`
		do
			if [ -d "$3/$file2" ]; then
				suffix "$old_name" "$new_name" "$3/$file2"
			fi

			if [ `echo $3/$file2 | sed 's/^.*\.//'` == $old_name ]; then
				mv $3/$file2 `echo $3/$file2 | sed 's/\.[^.]*$//'`.${new_name}
				file2=""
			fi
		done

	else
		echo "$3 is not a directory, why don't you use mv!"
	fi
}
function print_suffix_usage {

	echo  'Usage:'
	echo  'suffix <original> <new> <directory>'
}
