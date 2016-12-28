fps () {
	adb wait-for-device
	adb shell "while true ; do dumpsys SurfaceFlinger | grep \"vsync period\" ; sleep 0.1 ; done"
}
