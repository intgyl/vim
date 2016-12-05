#!/bin/sh

packramdisk() {

	usage="Usage: packramdisk <pack dir> <output dir>

	if no output file, use default ./ramdisk.img as output file"

	case $1 in
		--help)    exec echo "$usage";;
	esac

	INPUT=$1

	if [ ! -d "$INPUT" ]; then
		echo "$usage"
		return
	fi

	if  [ ! -n "$2" ] ;then
		OUTPUT=`pwd`/ramdisk.img
	else
		OUTPUT=$2/ramdisk.img
	fi

	echo "pack ramdisk to $OUTPUT"

	mkbootfs "$INPUT" | minigzip > $OUTPUT
	#cd `readlink -f $INPUT`;find . | cpio -o -H newc | gzip > $OUTPUT
}
