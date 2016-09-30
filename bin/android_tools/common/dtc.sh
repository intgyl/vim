dtc() {

	if [ $# != 1 ]; then
		print_usage
		return
	fi

	if [ -z `echo $1 | awk -F "." '{print $2}'` ]; then
		print_usage
		return

	elif [ `echo $1 | awk -F "." '{print $2}'` != "dtb" ]; then
		print_usage
		return
	fi

	$HOME/.vim/bin/android_tools/common/dtc -I dtb -O dts -o $(echo $1 | awk -F "." '{print$1}').dts $1
}

function print_usage {

	echo "Please input the dtb file"
	echo "\"dtc file.dtb\""
}
