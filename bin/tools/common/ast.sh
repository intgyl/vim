
ast () {
	value="$@"
	sysos=`uname -s`

	if [ $sysos == "Linux" ]; then
		if [ -d $value ]; then
			if [ $(find $value -type d | wc -l) -gt 1 ]; then

				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.cc
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.cpp
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.h
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.c
			else
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.cc
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.cpp
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.h
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.c

			fi
		else
			$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value
		fi
	elif [ $sysos == "Darwin" ]; then
		if [ -d $value ]; then
			if [ $(find $value -type d | wc -l) -gt 1 ]; then

				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.cc
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.cpp
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.h
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive $value/*.c
			else
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.cc
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.cpp
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.h
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value/*.c

			fi
		else
			$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none $value

		fi
	fi
	value=""
}

