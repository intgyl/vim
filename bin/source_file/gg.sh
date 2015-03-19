
gg () {
	value="$@"
	git grep -in "$value"

	if [ $? -eq 0 ]; then
		grep -inrH "$value" ./
	fi
	value=""
}

