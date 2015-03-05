#!/system/bin/sh
#get the touchscreen inputdevice's name
# 0035 ABS_MT_X_POS 0036 ABS_MT_Y_POS
all_name=`getevent -i | grep -E "/dev/input/event[0-9]|0035|0036" | grep -B 1 value | grep "add device"`
#event_dev=`echo $all_name | awk -F: '{print $2}'`
event_dev=`echo $all_name | grep -o /dev/input/event.`
check_ok=`echo $event_dev| grep -c "/dev/input/event[0-9]"`
if [ $check_ok != "1" ]; then
	echo error: no touchscreen found
	exit 1
else
	echo OK
fi

echo $event_dev
#real touch point
while true
do
sendevent $event_dev 3 48 200
sendevent $event_dev 3 53 931
sendevent $event_dev 3 54 360
sendevent $event_dev 3 50 1
sendevent $event_dev 0 2 0
sendevent $event_dev 1 330 1
sendevent $event_dev 0 0 0
sendevent $event_dev 3 48 200
sleep 2
done
