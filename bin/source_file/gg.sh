
gg () {
	value="$@"
	git grep -n "$value"
	value=""
}

