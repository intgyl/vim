pack() {

	if [ $# != 3 ]; then
		print_usage
		return
	fi

	if [ ! -d $3 ]; then
		echo "$2 does not exit"
		return
	fi

	out_path=$3

	case $1 in
		8976|8956|8992)
			system_xml="rawprogram_unsparse.xml"
			userdata_xml="rawprogram_unsparse.xml"
			cache_xml="rawprogram_unsparse.xml"
			;;
		8996)
			system_xml="rawprogram_unsparse4.xml"
			userdata_xml="rawprogram_unsparse0.xml"
			cache_xml="rawprogram_unsparse0.xml"
			;;
	esac

	case $2 in
		system)

			packsparseimg -t system -o $out_path -x $system_xml
			img2simg $out_path/system.raw $out_path/system.img
			rm -rf $out_path/system.raw
			;;

		userdata)
			packsparseimg -t userdata -o $out_path -x $userdata_xml
			img2simg $out_path/userdata.raw $out_path/userdata.img
			rm -rf $out_path/userdata.raw
			;;

		cache)
			packsparseimg -t cache -o $out_path -x $cache_xml
			img2simg $out_path/cache.raw $out_path/cache.img
			rm -rf $out_path/cache.raw
			;;
		*)
			echo "supprot \"system userdata cache\""
	esac
}

function print_usage {
echo 'Usage:'
echo 'pack <img> <out_path>'
}

supported="8976 8956 8992 8996"

function _comp_pack {
	local curw
	opts="-a -l -d -h"
	COMPREPLY=()
	curw=${COMP_WORDS[COMP_CWORD]}

	if [[ ${curw} == -*  ]] ; then
		COMPREPLY=( $(compgen -W "${opts}" -- ${curw})  )
		return 0
	fi

	COMPREPLY=($(compgen -W '$supported' -- $curw))

	return 0
}

# ZSH completion command
function _compzsh {
	reply=($(_l))
}

if [ $ZSH_VERSION ]; then
	compctl -K _compzsh pack
else
	shopt -s progcomp
	complete -F _comp_pack pack
fi

