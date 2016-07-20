list_target()
{
	target=$2
	for file2 in `ls $1`
	do
		if [ -d "$1/$file2"  ]; then
			list_target "$1/$file2" $target
		fi

		if [ "$file2" = "$target" ]; then
			echo "$1/$file2,`cat $1/$file2`"
		fi
	done
}

