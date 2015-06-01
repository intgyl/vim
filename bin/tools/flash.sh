#!/bin/bash
#[ "`whoami`" = root ] || exec sudo "$0" "$@"
#debugFlag=true
debugFlag=false
fastbootall=""
filename=""
do_flash()
{
	just_reboot=true
	if [ ! -z "$fastbootall" ]; then

		echo fastboot begin
		echo next will load $fastbootall
		if [[ ! -z `echo \"$fastbootall\" | grep -w bootloader` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash bootloader $filename
				if  ! $debugFlag ; then
					fastboot flash bootloader $filename
				fi
				filename=""
			else
				echo fastboot flash bootloader u-boot.bin
				if  ! $debugFlag ; then
					fastboot flash bootloader u-boot.bin
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w kernel` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash kernel $filename
				if  ! $debugFlag ; then
					fastboot flash kernel $filename
				fi
				filename=""
			else
				echo fastboot flash kernel zImage
				if  ! $debugFlag ; then
					fastboot flash kernel zImage
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w ramdisk` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash ramdisk $filename
				if  ! $debugFlag ; then
					fastboot flash ramdisk $filename
				fi
				filename=""
			else
				echo fastboot flash ramdisk ramdisk.img.ub
				if  ! $debugFlag ; then
					fastboot flash ramdisk ramdisk.img.ub
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w system` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash system $filename
				if  ! $debugFlag ; then
					fastboot flash system $filename
				fi
				filename=""
			else
				echo fastboot flash system system.img
				if  ! $debugFlag ; then
					fastboot flash system system.img
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w userdata` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash userdata $filename
				if  ! $debugFlag ; then
					fastboot flash userdata $filename
				fi
				filename=""
			else
				echo fastboot flash userdata userdata.img
				if  ! $debugFlag ; then
					fastboot flash userdata userdata.img
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w recoverykernel` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash recoverykernel $filename
				if  ! $debugFlag ; then
					fastboot flash recoverykernel $filename
				fi
				filename=""
			else
				echo fastboot flash recoverykernel zImage
				if  ! $debugFlag ; then
					fastboot flash recoverykernel zImage
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w recovery` ]]; then
			just_reboot=false
			if [ ! -z "$filename" ]; then
				echo fastboot flash recovery $filename
				if  ! $debugFlag ; then
					fastboot flash recovery $filename
				fi
				filename=""
			else
				echo fastboot flash recovery ramdisk-recovery.img.ub
				if  ! $debugFlag ; then
					fastboot flash recovery ramdisk-recovery.img.ub
				fi
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w cache` ]]; then
			just_reboot=false
			echo fastboot erase cache
			if  ! $debugFlag ; then
				fastboot erase cache
			fi
		fi
		if [[ ! -z `echo $fastbootall | grep -w reboot` ]]; then
			echo fastboot reboot
			if  ! $debugFlag ; then
				if  ! $just_reboot ; then
					echo  -e "\nfastboot over,input any key to continue..."
					read -n 1
				fi
				fastboot reboot
			fi
		fi
	fi
}
function flash.sh {
echo adb reboot-bootloader
if  ! $debugFlag ;then
	adb reboot-bootloader
fi
if [ ! -z $1 ]; then
	if $debugFlag ;then
		echo \$1 != null so check case
	fi
	case $1 in
		-v|-r)
			if [ -z $2 ]; then
				print_flash_usage
			else
				case $2 in
					ramdisk)
						if $debugFlag ;then
							echo fastboot not load $2
						fi
						if [ $1 = "-r" ]; then
							fastbootall="kernel system userdata"
						elif [ $1 = "-v" ]; then
							fastbootall="kernel system userdata reboot cache"
						fi
						;;
					userdata)
						if $debugFlag ;then
							echo fastboot not load $2
						fi
						if [ $1 = "-r" ]; then
							fastbootall="kernel system ramdisk"
						elif [ $1 = "-v" ]; then
							fastbootall="kernel system ramdisk reboot cache"
						fi
						;;
					kernel)
						if $debugFlag ;then
							echo fastboot not load $2
						fi
						if [ $1 = "-r" ]; then
							fastbootall="userdata system ramdisk"
						elif [ $1 = "-v" ]; then
							fastbootall="userdata system ramdisk cache reboot"
						fi
						;;
					system)
						if $debugFlag ;then
							echo fastboot not load $2
						fi
						if [ $1 = "-r" ]; then
							fastbootall="kernel kernel system ramdisk"
						elif [ $1 = "-v" ]; then
							fastbootall="kernel system ramdisk cache reboot"
						fi
						fastbootall="ramdisk userdata"
						;;
					*)
						echo "$2 Didn't match anything"
						print_flash_usage
						;;
				esac

			fi
			;;
		bootloader|ramdisk|kernel|system|userdata|recoverykernel|recovery|reboot)
			fastbootall="$1 reboot"
			if [ -z $2 ]; then
				filename=""
			else
				filename=$2
			fi

			;;
		all)
			fastbootall="reboot cache bootloader ramdisk kernel system userdata recoverykernel recovery"
			;;
		*)
			print_flash_usage
			;;
	esac
else
	fastbootall="bootloader ramdisk kernel system userdata recoverykernel recovery reboot cache"
	if $debugFlag ;then
		echo \$1 = null so set $fastbootall
	fi
fi
do_flash
}

function print_flash_usage {
echo  'Usage:'
echo  '-v <image_name> - flash all image but this <image_name>"'
echo  'image <path/imagename> - if has path/imagename,load it,or just as ./'
echo  '-h(-help,--help)   - Lists usage'
echo  '<all>    - Jump to the bookmark'
}
function _comp_flash {
local curw prev
opts_flash="-v -h"
flash_name="bootloader ramdisk kernel system userdata recoverykernel recovery reboot all"

COMPREPLY=()
curw=${COMP_WORDS[COMP_CWORD]}
prev="${COMP_WORDS[COMP_CWORD-1]}"
case "${prev}" in
	bootloader|ramdisk|kernel|system|userdata|recoverykernel|recovery)
		COMPREPLY=( $(compgen -o filenames -W "`ls`" -- ${curw})  )
		;;
	*)
		case "${curw}" in
			-)
				COMPREPLY=( $(compgen -W "${opts_flash}" -- ${curw})  )
				;;
			*)
				COMPREPLY=( $(compgen -W "${flash_name}" -- ${curw})  )
		esac
		;;
esac
return 0
}

shopt -s progcomp
complete -F _comp_flash flash.sh
