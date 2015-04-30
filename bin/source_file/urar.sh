urar() {
		if [ $# -lt 1 ]; then
			unrar
		fi
		dest_file=`echo $1| awk -F".rar" '{print $1}'`
		echo $dest_file
		unrar x  $@  $dest_file
}

