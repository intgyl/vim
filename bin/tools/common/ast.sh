
ast () {
	value="$@"
	sysos=`uname -s`

	if [ $sysos == "Linux" ]; then
		if [ -d $value ]; then
			if [ $(find $value -type d | wc -l) -gt 1 ]; then

				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cc
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cpp
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.h
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.c
			else
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cc
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cpp
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.h
				$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.c

			fi
		else
			$HOME/.vim/bin/tools/linux/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value
		fi
	elif [ $sysos == "Darwin" ]; then
		if [ -d $value ]; then
			if [ $(find $value -type d | wc -l) -gt 1 ]; then

				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cc
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cpp
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.h
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --recursive --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.c
			else
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cc
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.cpp
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.h
				$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value/*.c

			fi
		else
			$HOME/.vim/bin/tools/mac/astyle --style=linux -p --indent=force-tab=8 --break-blocks=all --indent-switches --pad-oper --pad-comma --pad-header --suffix=none --align-pointer=name --align-reference=name --break-one-line-headers --attach-return-type --attach-return-type-decl $value

		fi
	fi
	value=""
}

