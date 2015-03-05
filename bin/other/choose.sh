#!/bin/bash
DIR_ROOT=$(pwd)
DIR_UBOOT=$DIR_ROOT/../uboot
DIR_KERNEL=$DIR_ROOT/../kernel
DIR_ANDROID=$DIR_ROOT/../android
#make bootloader
NotChoose=true
function repo_make
{
	echo repo_make
}
function just_make
{
	echo just_make
}

function Confirm
{
 	echo "  Useage: ./mkimg.sh you_want			"
	echo "          a. repo a new git to test		"
	echo "          b. use a exit git to sync then make	"
	echo "          q. Quit					"
	echo -n "Choose: "
	read Result
}
function Choose_dir
{
	which=1
	ls -lt | grep -e "^d" | awk '{print "---->"$8;which+=1}' | sed -n /^/$which/p
#	ls -lt | grep -e "^d" |
#	echo "          b. use a exit git to sync then make	"
#	echo "          q. Quit					"
#	echo -n "Choose: "
#	read Result
}
while $NotChoose
do
	NotChoose=false
	echo NotChoose=$NotChoose
	Confirm
	case $Result in
	a)
		repo_make
		;;
	b)
		Choose_dir
		;;
	q)
		exit 0
		;;
	*) echo "not correct input"
		echo "Result = $Result"
		NotChoose=true
		;;
	esac
done

