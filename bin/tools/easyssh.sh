#! /bin/bash
server_bookmark="$HOME/.data_server_bookmark"
if test ! -e $server_bookmark
then
	touch $server_bookmark
fi
chmod 600 $server_bookmark
ssg () {
	case $1 in
		-d)
			temp=`mktemp -t .gtdirs-XXXXXX`
			sed "/^$2=/"d $server_bookmark > $temp
			mv $temp $server_bookmark
			rm -f $temp
			;;
		-a)
			validate_server_bookmark_name "$@"
			if [ -z "$result" ]; then
				 echo "$2=$3=$4" >> $server_bookmark
			fi
			;;
		-l)
			cat $server_bookmark
			;;
		-h)
			print_easyssh_usage
			;;
		*)
			if [ -z $1 ]; then
				print_easyssh_usage
			elif [[ ! -z `awk -F '=' '/^'"$1"'=/ {print $3 }' $server_bookmark` ]]; then
				echo use sshpass
				sshpass -p `awk -F '=' '/^'"$1"'=/ {print $3" ssh -X "$2 }' $server_bookmark`
			elif [[ ! -z `awk -F '=' '/^'"$1"'=/ {print $2 }' $server_bookmark` ]]; then
				echo ssh only
				ssh -X `awk -F '=' '/^'"$1"'=/ {print $2 }' $server_bookmark`
			else
				echo 'error: bookmark name not found'

			fi
	esac

}
#validate names
function validate_server_bookmark_name {
	#echo 1=$1 2=$2 3=$3
	result=""
	if [ -z $3 ]; then
		result='error: bookmark name required!'
		echo $result
	elif [ -z `echo $2 | sed 's/[^A-Za-z0-9_]//g' ` ]; then
		result='error: bookmark name is invalid!'
	elif [ -z `echo $3 | grep @ ` ]; then
		result='error: server name is invalid!'
		echo $result
	fi
}

function print_easyssh_usage {
	  	echo  'Usage:'
       	echo  '-a bookmark_name user@server <passwd>		- Saves the current server as "bookmark_name"'
       	echo  '-d <bookmark_name> 	- Deletes the bookmark'
       	echo  '-l                 	- Lists all available bookmarks'
       	echo  '-h(-help,--help)   	- Lists usage'
       	echo  '<bookmark_name>    	- login to the server'
}

#list of server_bookmarks
function _l_server {
	awk -F '=' ' {print $1} ' $server_bookmark
}

#auto complete the option or servername
function _comp_ssh {
    local curw
    opts="-a -l -d -h"
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curw} == -*  ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${curw})  )
        return 0
    fi
    COMPREPLY=($(compgen -W '`_l_server`' -- $curw))
    return 0
}

shopt -s progcomp
complete -F _comp_ssh ssg
