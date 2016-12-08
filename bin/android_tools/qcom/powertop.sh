powertop() {

	root_string="adbd cannot run as root in production builds"

	if [ $# != 1 ]; then
		print_powertop_usage
		return
	fi

	 expr $1 + 0 &>/dev/null

	if [ $? -ne 0 ]; then
		echo "Args must be integer"
		print_powertop_usage
		return
	fi

	if [ $1 -le 0 ]; then
		print_powertop_usage
		return
	fi

	echo "Waiting for device"

	adb wait-for-device

	root=`adb root`
	if [ "$root" = "$root_string" ]; then
		echo "Need root permission"
		return
	fi
	adb remount > /dev/null

	adb push $HOME/.vim/bin/android_tools/qcom/powertop /data/ > /dev/null

	echo "Push powertop to /data/"

	adb shell "chmod +x /data/powertop"

	echo "Collecting data..."
	adb shell "/data/powertop -r -d -t $1 > /data/dumptop.txt"
	adb pull /data/dumptop.txt . > /dev/null

	echo "Dump to /data/dumptop.txt"

	echo "Pull to `pwd`/dumptop.txt"

}

function print_powertop_usage {
	echo 'Usage:'
	echo 'powertop <seconds>'
}
