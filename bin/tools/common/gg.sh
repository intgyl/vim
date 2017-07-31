
gg () {
	value="$@"
	sysos=`uname -s`
	if [ $sysos == "Linux" ]; then
		$HOME/.vim/bin/tools/linux/grep --color=auto -inrH "$value" ./
	elif [ $sysos == "Darwin" ]; then
		$HOME/.vim/bin/tools/mac/grep --color=auto -inrH "$value" ./
	fi
	value=""
}

ggw () {
	value="$@"
	sysos=`uname -s`
	if [ $sysos == "Linux" ]; then
		$HOME/.vim/bin/tools/linux/grep --color=auto -inrHw "$value" ./
	elif [ $sysos == "Darwin" ]; then
		$HOME/.vim/bin/tools/mac/grep --color=auto -inrHw "$value" ./
	fi
	value=""
}

