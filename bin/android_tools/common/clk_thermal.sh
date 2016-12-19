if [ $# = 0 ]; then
	echo " Usage:"
	echo "clk_thermal -c -g -t"
	exit
fi

cpu_clk="false"
gpu_clk="false"
thermal_zone="false"

while getopts cgt opt
do
	case $opt in
		c)
			cpu_clk="true"
			;;
		g)
			gpu_clk="true"
			;;
		t)
			thermal_zone="true"
			;;
		*)
			exit
	esac
done

echo "Store to /sdcard/clk_thermal"

if [ -e "/sdcard/clk_thermal"  ]; then
	mv /sdcard/clk_thermal /sdcard/clk_thermal.old
fi

if [ $cpu_clk = "true" ]; then
	cd /sys/devices/system/cpu/
	cpu=`ls -d cpu*[0-9]`

	for i in $cpu; do
		echo "$i" | tr -d "\n\r" >> /sdcard/clk_thermal
		echo "," | tr -d "\n\r" >> /sdcard/clk_thermal
	done

fi

if [ $gpu_clk = "true" ]; then
	echo "gpuclk" | tr -d "\n\r" >> /sdcard/clk_thermal
	echo "," | tr -d "\n\r" >> /sdcard/clk_thermal

	echo "gpubusy" | tr -d "\n\r" >> /sdcard/clk_thermal
	echo "," | tr -d "\n\r" >> /sdcard/clk_thermal

fi

if [ $thermal_zone = "true" ]; then
	cd /sys/devices/virtual/thermal/
	thermal=`ls -d thermal_zone*[0-9]`

	for i in $thermal; do
		echo "$i" | tr -d "\n\r" >> /sdcard/clk_thermal
		echo "," | tr -d "\n\r" >> /sdcard/clk_thermal
	done
fi

echo "" >> /sdcard/clk_thermal


while true
do
	if [ $cpu_clk = "true" ]; then
		cd /sys/devices/system/cpu/
		for i in $cpu; do
			cat "$i/cpufreq/scaling_cur_freq" | tr -d "\n\r" >> /sdcard/clk_thermal
			echo "," | tr -d "\n\r" >> /sdcard/clk_thermal
		done

	fi

	if [ $gpu_clk = "true" ]; then
		cat /sys/class/kgsl/kgsl-3d0/gpuclk | tr -d "\n\r" >> /sdcard/clk_thermal
		echo "," | tr -d "\n\r" >> /sdcard/clk_thermal

		cat /sys/class/kgsl/kgsl-3d0/gpubusy | tr -d "\n\r" >> /sdcard/clk_thermal
		echo "," | tr -d "\n\r" >> /sdcard/clk_thermal

	fi

	if [ $thermal_zone = "true" ]; then
		cd /sys/devices/virtual/thermal/
		for i in $thermal; do
			cat "$i/temp" | tr -d "\n\r" >> /sdcard/clk_thermal
			echo "," | tr -d "\n\r" >> /sdcard/clk_thermal
		done

	fi

	echo "" >> /sdcard/clk_thermal
done
