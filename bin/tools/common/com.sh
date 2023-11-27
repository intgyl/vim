#!/bin/bash
#[ "`whoami`" = root ] || exec sudo "$0" "$@"
com() {
	if [  ! -d $HOME/log/minicom_log/ ]; then
		echo "there is no log directory"
		echo "mkdir -p $HOME/log/minicom_log/"
		mkdir -p $HOME/log/minicom_log/
	fi
	today_dir=`LCALL=C date +%F`
	if [  ! -d $HOME/log/minicom_log/$today_dir ]; then
		echo auto midir $HOME/log/minicom_log/$today_dir
		mkdir $HOME/log/minicom_log/$today_dir
	fi
	#if [  -z $HOME/.data_my_passwd ]; then
	#	echo there is no passwd file, please input the passwd to $HOME/.data_my_passwd
	#	exit 1
	#fi
	#cat $HOME/.data_my_passwd | sudo -S ls > /dev/null

	logname=$today_dir/`LCALL=C date +%H%M%S`

	if [ $# != 0 ]; then
		sudo minicom -c on -w $@
	else
		sudo minicom -c on -w -C $HOME/log/minicom_log/${logname}.log
	fi
}
