list_all()
{
	for file2 in `ls $1`
	do
		if [ -d "$1/$file2"  ]; then
			list_alldir "$1/$file2"
		fi

		echo "$1/$file2,`cat $1/$file2`"
	done
}

