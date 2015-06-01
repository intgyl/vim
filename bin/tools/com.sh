#!/bin/bash
#[ "`whoami`" = root ] || exec sudo "$0" "$@"
com() {
	if [  ! -d ~/log ]; then
		echo there is no log derectery, please input this command
		echo "mkdir ~/log"
		exit 1
	fi
	today_dir=`LCALL=C date +%F`
	if [  ! -d ~/log/$today_dir ]; then
		echo auto midir ~/log/$today_dir
		mkdir ~/log/$today_dir
	fi
	#if [  -z ~/.data_my_passwd ]; then
	#	echo there is no passwd file, please input the passwd to ~/.data_my_passwd
	#	exit 1
	#fi
	#cat ~/.data_my_passwd | sudo -S ls > /dev/null

	logname=$today_dir/`LCALL=C date +%H%M%S`
	#echo param=$#
	if [ $# != 0 ]; then
		sudo minicom $@
	else
		sudo minicom -C ~/log/${logname}.log
	fi
}
