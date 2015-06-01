
ast () {
	value="$@"
	if [ -d $value ]; then
		if [ $(find $value -type d | wc -l) -gt 1 ]; then

			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cc
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.cpp
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.h
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none --recursive $value/*.c
		else
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none $value/*.cc
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none $value/*.cpp
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none $value/*.h
			~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none $value/*.c

		fi
	else
		~/.vim/bin/tools/astyle --style=linux -p --indent=force-tab --suffix=none $value
	fi
	value=""
}

