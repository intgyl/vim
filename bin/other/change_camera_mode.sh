#!/system/bin/sh
while true
do
#rec
sendevent /dev/input/event2 3 48 200
sendevent /dev/input/event2 3 53 885
sendevent /dev/input/event2 3 54 680
sendevent /dev/input/event2 3 50 1
sendevent /dev/input/event2 0 2 0
sendevent /dev/input/event2 1 330 1
sendevent /dev/input/event2 0 0 0
sendevent /dev/input/event2 1 330 0
sendevent /dev/input/event2 0 0 0
msleep 500
#full                           
sendevent /dev/input/event2 3 48 200
sendevent /dev/input/event2 3 53 967
sendevent /dev/input/event2 3 54 689
sendevent /dev/input/event2 3 50 1
sendevent /dev/input/event2 0 2 0
sendevent /dev/input/event2 1 330 1
sendevent /dev/input/event2 0 0 0
sendevent /dev/input/event2 1 330 0
sendevent /dev/input/event2 0 0 0
msleep 500
#cap                            
sendevent /dev/input/event2 3 48 200
sendevent /dev/input/event2 3 53 816
sendevent /dev/input/event2 3 54 690
sendevent /dev/input/event2 3 50 1
sendevent /dev/input/event2 0 2 0
sendevent /dev/input/event2 1 330 1
sendevent /dev/input/event2 0 0 0
sendevent /dev/input/event2 1 330 0
sendevent /dev/input/event2 0 0 0
msleep 500
done
