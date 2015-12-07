kp() {
	ps -u `logname` | grep $1| awk '{print$1}' | xargs kill -9
}
