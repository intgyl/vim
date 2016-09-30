
gg () {
	value="$@"
	sysos=`uname -s`
	if [ $sysos == "Linux" ]; then
		$HOME/.vim/bin/tools/grep_linux --color=auto -inrH "$value" ./
	elif [ $sysos == "Darwin" ]; then
		$HOME/.vim/bin/tools/grep_mac --color=auto -inrH "$value" ./
	fi
	value=""
}

