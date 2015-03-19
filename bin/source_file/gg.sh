
gg () {
	value="$@"
	git grep -in "$value"

	if [ $? != 0 ]; then
		grep -inrH "$value" ./
	fi
	value=""
}

