connect() {
	unset ip
	echo -e "Waiting for device\n"
	adb wait-for-device
	adb root
	adb wait-for-device
	adb tcpip 5555
	adb wait-for-device
#	adb shell setprop service.adb.tcp.port 5555

	ip=`adb shell ifconfig wlan0|grep 'inet addr'|awk -F'[ : ]' '{print $13}'`

	if [ -z $ip ]; then
		echo -e "\nThe device does not connect to any AP\n"
		return
	fi

	echo "********************************"
	echo "Run Command:                   *"
	echo "adb connect $ip:5555 *"
	echo "********************************"

	adb connect $ip:5555

}
