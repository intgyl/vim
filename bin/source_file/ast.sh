
ast () {
	value="$@"
	if [ -d $value ]; then
		if [ $(find $value -type d | wc -l) -gt 1 ]; then

			echo "in >1"
			astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cc
			astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cpp
			astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.h
			astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.c
		else
			astyle --style=linux -p --indent=force-tab --suffix=none $value/*.cc
			astyle --style=linux -p --indent=force-tab --suffix=none $value/*.cpp
			astyle --style=linux -p --indent=force-tab --suffix=none $value/*.h
			astyle --style=linux -p --indent=force-tab --suffix=none $value/*.c

		fi
	else
		astyle --style=linux -p --indent=force-tab --suffix=none $value
	fi
	value=""
}

