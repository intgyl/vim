kp() {
	sysos=`uname -s`
	if [ $sysos == "Linux" ]; then
		ps -u `whoami` | grep $1| awk '{print$1}' | xargs kill -9
	elif [ $sysos == "Darwin" ]; then
		ps -u `whoami` | grep $1| awk '{print$2}' | xargs kill -9
	fi
}
