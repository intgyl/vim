#!/bin/sh

unpackramdisk() {

	usage="Usage: unpackramdisk file, unpack to ./ramdisk"


	case $1 in
		--help)    exec echo "$usage";;
	esac

	INPUT_FILE=$1
	OUTPUT_DIR="ramdisk"

	if [ ! -f "$INPUT_FILE" ]; then
		echo -e "\033[31mErr: $1 does not exist\033[0m"
		echo "$usage"
		return
	fi

	if [ ! -d "$OUTPUT_DIR" ]; then
		mkdir $OUTPUT_DIR
	fi

	echo "output to dir $OUTPUT_DIR"

	cd $OUTPUT_DIR
	exec gzip -d -c "../$INPUT_FILE" | cpio -idu
	cd ..
}
