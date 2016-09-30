dtc() {

	if [ $# != 1 ]; then
		print_usage
		return
	fi

	if [ -z `echo $1 | sed 's/^.*\.//'` ]; then
		print_usage
		return

	elif [ `echo $1 | sed 's/^.*\.//'` != "dtb" ]; then
		print_usage
		return
	fi

	$HOME/.vim/bin/android_tools/common/dtc_bin -I dtb -O dts -o $(echo $1 | sed 's/\.[^.]*$//').dts $1
}

function print_usage {

	echo "Please input the dtb file"
	echo "\"dtc file.dtb\""
}
