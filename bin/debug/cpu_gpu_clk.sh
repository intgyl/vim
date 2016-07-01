clk() {
	while true
	do
		adb wait-for-device
		echo "****************cpu clk***************"
		adb shell "cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq"
		echo "****************gpu clk***************"
		adb shell "cat /sys/class/kgsl/kgsl-3d0/gpuclk"
		echo "****************gpubusy***************"
		adb shell "cat /sys/class/kgsl/kgsl-3d0/gpubusy"

		sleep 0.5
	done
}
