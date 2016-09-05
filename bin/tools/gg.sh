
gg () {
	value="$@"
	sysos=`uname -s`
	if [ $sysos == "Linux" ]; then
		~/.vim/bin/tools/grep_linux --color=auto -inrH "$value" ./
	elif [ $sysos == "Darwin" ]; then
		~/.vim/bin/tools/grep_mac --color=auto -inrH "$value" ./
	fi
	value=""
}

