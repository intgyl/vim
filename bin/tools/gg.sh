
gg () {
	value="$@"
	~/.vim/bin/tools/grep --color=auto -inrH "$value" ./
	value=""
}

