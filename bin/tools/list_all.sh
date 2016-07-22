list_all()
{
	for file2 in `ls $1`
	do
		if [ -d "$1/$file2"  ]; then
			list_all "$1/$file2"
		fi

		if [ -a $1/$file2 ]; then
			echo "$1/$file2,`cat $1/$file2`"
		fi
	done
}

