#!/system/bin/sh
while true
do
	if [ -d /sdcard/handaer_log ] ; then
		if [ -a /sdcard/handaer_log/catch ]; then
#echo catch is exist so need catch log
			if [ -a /sdcard/handaer_log/kernel_pid ];then
#				echo "exist kernel_pid,so keep it"
				sleep 5
			else
#				echo "begin catch kernel log"
				nohup cat /proc/kmsg > /sdcard/handaer_log/kmsg_$(date +"%F%H%M%S").txt &  
				echo $! > /sdcard/handaer_log/kernel_pid 
				date +"%F%H%M%S" > /sdcard/handaer_log/last_time_kernel
			fi
			if [ -a /sdcard/handaer_log/logcat_pid ];then
#				echo "exist logcat_pid ,so keep it"
				sleep 5
			else
#				echo "begin catch logcat log"
				nohup logcat -v time > /sdcard/handaer_log/logcat_$(date +"%F%H%M%S").txt &  
				echo $! > /sdcard/handaer_log/logcat_pid 
				date +"%F%H%M%S" > /sdcard/handaer_log/last_time_logcat
			fi
		else
#			echo "catch isn't exist so stop catch log"
			if [ -a /sdcard/handaer_log/kernel_pid ];then
#				echo "exist kernel_pid so kill it"
				kill $(cat /sdcard/handaer_log/kernel_pid)
				rm /sdcard/handaer_log/kernel_pid
			fi
			if [ -a /sdcard/handaer_log/logcat_pid ];then
#				echo "exist logcat_pid so kill it"
				kill $(cat /sdcard/handaer_log/logcat_pid)
				rm /sdcard/handaer_log/logcat_pid
			fi
			
		fi
	fi
	sleep 3
done
