
ast () {
	value="$@"
	if [ -d $value ]; then
		astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.h
		astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.c
		astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cpp
		astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cc
	else
		astyle --style=linux -p --indent=force-tab --suffix=none $value
	fi
	value=""
}

