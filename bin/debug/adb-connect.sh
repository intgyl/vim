adb-connect() {
	unset ip
	adb wait-for-device
	adb root
	adb wait-for-device
	adb shell setprop service.adb.tcp.port 5555

	ip=`adb shell ifconfig wlan0|grep 'inet addr'|awk -F'[ : ]' '{print $13}'`
	echo "********************************"
	echo "Run Command:                   *"
	echo "adb connect $ip:5555 *"
	echo "********************************"

	adb connect $ip:5555

}
