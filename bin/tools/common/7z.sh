7za () {
		if [ $# -lt 1 ]; then
			7z
		fi
		7z a $@.7z $@
}

7zx () {
		if [ $# -lt 1 ]; then
			7z
		fi
		7z x $@

}
