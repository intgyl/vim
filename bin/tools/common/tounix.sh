#!/bin/bash

tounix () {
	# zsh does not word-split unquoted command substitutions by default
	if [ -n "$ZSH_VERSION" ]; then
		setopt localoptions shwordsplit
	fi
	if [ -d $1 ]; then

		for file in `ls $1`
		do
			if [ -d $1"/"$file ]
			then
				tounix $1"/"$file
			else
				dos2unix $1"/"$file
				#echo $1"/"$file
			fi
		done
	else
		dos2unix $1
	fi
}
