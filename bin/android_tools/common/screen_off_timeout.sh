screen-off-time() {

	if [ $# = 0 ]; then
		print_screen_off_time
		return
	fi
	adb shell settings put system screen_off_timeout $1
}

function print_screen_off_time {
echo 'Usage:'

echo 'screen-off-time <ms>'

}
