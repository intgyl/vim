value_test=10000000001;
value_ok=100;
value_error=10000000000
while true ; do
	java -Xmx"$value_test"M -version 2>&1 > /dev/null
	if [ $? != 0 ]; then
		value_error=$value_test
		value_test=$[$value_error-$value_ok]
		value_test=$[$value_ok+$value_test/2]

	else
		if [ $value_ok == $value_test ];then
			echo value="$value_ok"M
			exit 0
		else
			value_ok=$value_test
			value_test=$[$value_error-$value_ok]
			value_test=$[$value_ok+$value_test/2]
		fi
	fi
	#echo value=$value_ok
done
