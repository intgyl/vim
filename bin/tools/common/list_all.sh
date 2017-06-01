list_all()
{
	if [ -z $1 ]; then
		print_list_all_usage
		return
	fi

	if [ ! -d $1 ]; then
		print_list_all_usage
		return
	fi

	for file2 in `ls $1`
	do
		if [ -L "$1/$file2" ]; then
			continue
		fi

		if [ -d "$1/$file2"  ]; then
			list_all "$1/$file2"
		fi

		if [ -a $1/$file2 ]; then
			echo "$1/$file2"
			echo "`cat $1/$file2`"
			echo ""
		fi
	done
}

function print_list_all_usage {

	echo  'Usage:'
	echo  'list_all <directory>'
}
