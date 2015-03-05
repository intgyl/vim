#! /bin/bash
#need source this file before use it
#you can add "source ~/.vim/bin/gt.sh" to ~/.bashrc
DIRS="$HOME/.data_gtdirs"
if test ! -e $DIRS
then
	touch $DIRS
fi

gt () {
	case $1 in
		-d)
			temp=`mktemp -t .gtdirs-XXXXXX`
			sed "/^$2=/"d $DIRS > $temp
			mv $temp $DIRS
			rm -f $temp
			;;
		-a)
			validate_gt_bookmark_name "$@"
			if [ -z "$result" ]; then
				CURDIR=$PWD
				 echo "$2=$CURDIR" >> $DIRS
			fi
			;;
		-l)
			cat $DIRS
			;;
		-h)
			print_gt_usage
			;;
		*)
			if [ -z $1 ]; then
				print_gt_usage
			elif [[ ! -z `awk -F '=' '/^'"$1"'=/ {print $2 }' $DIRS` ]]; then
				cd `awk -F '=' '/^'"$1"'=/ {print $2 }' $DIRS`
			else
				echo 'error: bookmark name not found'

			fi

	esac
}

#validate names
function validate_gt_bookmark_name {
	result=""
	if [ -z $2 ]; then
		result='error: bookmark name required!'
		echo $result
	elif [ -z `echo $2 | sed 's/[^A-Za-z0-9_]//g' ` ]; then
		result='error: bookmark name is invalid!'
		echo $result
	elif [[ -n `grep ^$2= $DIRS ` ]]; then
		result='error:'
		echo "error: bookmark name \"$2\" is already used, Please change another name!"
	fi

}

function print_gt_usage {
	  	echo  'Usage:'
       	echo  '-a <bookmark_name> - Saves the current directory as "bookmark_name"'
       	echo  '-d <bookmark_name> - Deletes the bookmark'
       	echo  '-l                 - Lists all available bookmarks'
       	echo  '-h(-help,--help)   - Lists usage'
       	echo  '<bookmark_name>    - Jump to the bookmark'
}

function _l_gt {
	awk -F '=' ' {print $1} ' $DIRS
}


function _comp_gt {
    local curw
    opts="-a -l -d -h"
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curw} == -*  ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${curw})  )
        return 0
    fi
    COMPREPLY=($(compgen -W '`_l_gt`' -- $curw))
    return 0
}

# ZSH completion command
function _compzsh {
    reply=($(_l))
}


if [ $ZSH_VERSION ]; then
	compctl -K _compzsh gt
else
	shopt -s progcomp
	complete -F _comp_gt gt
fi

