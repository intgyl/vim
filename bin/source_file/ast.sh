
ast () {
	value="$@"
	astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.c
	astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.h
	astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cc
	astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cpp
	value=""
}

