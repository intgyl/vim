
gg () {
	value="$@"
	grep -inrH "$value" ./
	value=""
}

