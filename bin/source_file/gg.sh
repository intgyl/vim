
gg () {
	value="$@"
	git grep -in "$value"
	value=""
}

