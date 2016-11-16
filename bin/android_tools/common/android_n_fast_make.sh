fmk() {

	if [ $# != 1 ]; then
		print_fmk_usage
		return
	fi

	case $1 in
		bootimage)
			image="bootimage" ;;
		systemimage)
			image="systemimage"
			;;
		aboot)
			image="aboot"
			;;
		recoveryimage)
			image="recoveryimage"
			;;
		otapackage)
			image="otapackage"
			;;
		updatepackage)
			image="updatepackage"
			;;
		*)
			echo -e "\n'$1' is not supported\n"
	esac

	CPU_JOB_NUM=$(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+1}')

	if [ ! $OUT ]; then
		echo "Please run command:"
		echo "****************************"
		echo "* source build/envsetup.sh *"
		echo "* lunch product_name       *"
		echo "****************************"
		return
	fi
	export NINJA_STATUS="[%p %s/%t] " && source out/env-odin.sh && out/host/linux-x86/bin/makeparallel --ninja prebuilts/ninja/linux-x86/ninja $image -C . -f out/build-odin.ninja -j$CPU_JOB_NUM
}

function print_fmk_usage {
	echo 'Usage'
	echo 'fmk <image>'
}

supported="systemimage aboot bootimage recoveryimage otapackage updatepackage"

function _comp_fmk {
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
	compctl -K _compzsh fmk
else
	shopt -s progcomp
	complete -F _comp_fmk fmk
fi

