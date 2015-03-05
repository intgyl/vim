uzip () {
		if [ $# -lt 1 ]; then
			unzip
		fi
		dest_file=`echo $1| awk -F".zip" '{print $1}'`
		echo $dest_file
		unzip $@ -d $dest_file
}

