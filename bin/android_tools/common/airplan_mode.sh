airplane_mode_on() {
	adb shell settings put global airplane_mode_on 1
	adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true

}

airplane_mode_off() {
	adb shell settings put global airplane_mode_on 0
	adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false

}
