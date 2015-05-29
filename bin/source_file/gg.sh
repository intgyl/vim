
gg () {
	value="$@"
	~/.vim/bin/grep --color=auto -inrH "$value" ./
	value=""
}

