list_target()
{
	if [ $# != 2 ]; then
		print_list_target_usage
		return
	fi
	if [ -z $1 ]; then
		print_list_target_usage
		return
	fi

	if [ ! -d $1 ]; then
		print_list_target_usage
		return
	fi

	target=$2
	for file2 in `ls $1`
	do
		if [ -L "$1/$file2" ]; then
			continue
		fi

		if [ -d "$1/$file2"  ]; then
			list_target "$1/$file2" $target
		fi

		if [ "$file2" = "$target" ]; then
			echo "$1/$file2,`cat $1/$file2`"
			file2=""
		fi
	done
}

function print_list_target_usage {

	echo  'Usage:'
	echo  'list_all <directory> <target>'

}
