edl-flash() {

	if [ $# != 1 ]; then
		print_usage
		return
	fi

	case $1 in
		8936)
			prog_ddr_file="prog_emmc_firehose_8936.mbn"
			xml_file="rawprogram0.xml"
			platform="old"
			;;
		8956|8976)
			prog_ddr_file="prog_emmc_firehose_8976_ddr.mbn"
			xml_file="rawprogram0.xml"
			platform="old"
			;;
		8992)
			prog_ddr_file="prog_emmc_firehose_8992_ddr.mbn"
			xml_file="rawprogram_unsparse.xml"
			platform="old"
			;;
		8996)
			prog_ddr_file="prog_ufs_firehose_8996_ddr.elf"
			platform="new"
			;;
		*)
			echo -e "\n'$1' is not supported now\n"
	esac

	if [ ! -e $prog_ddr_file ]; then
		echo "$prog_ddr_file is not exist"
		echo "Please go to the package directory"
		return
	fi

	adb devices |  sed -n 2p | grep device > /dev/null
	if [ $? = 0 ]; then
		adb reboot edl
		sleep 2
	fi

	loop_time=0
	lsusb | grep 'QDL mode'

	while [ $? != 0 ]
	do
		echo "wait for COM(9008)"
		sleep 2
		loop_time=$(expr $loop_time + 1)
		if [ $loop_time = 10 ]; then
			echo "###################################"
			echo "######   No Device Found!!   ######"
			echo "###################################"
			exit 1
		fi
		lsusb | grep 'QDL mode'
	done

	port_num=$(ls /sys/bus/usb-serial/drivers/qcserial/ | grep tty)

	script_dir="$HOME/.vim/bin/android_tools/qcom"

	if [ $platform = "old" ]; then

		sudo $script_dir/QSaharaServer -p /dev/$port_num -s 13:$prog_ddr_file

		busybox sleep 5
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=$xml_file

		busybox sleep 5
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch0.xml

		busybox sleep 3
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --reset

	elif [ $platform = "new" ]; then
		sudo $script_dir/QSaharaServer -p /dev/$port_num -s 13:$prog_ddr_file

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram_unsparse0.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch0.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram1.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch1.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram2.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch2.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram3.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch3.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram_unsparse4.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch4.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram5.xml --memoryname=UFS
		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch5.xml --memoryname=UFS

		sudo $script_dir/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --memoryname=UFS --setactivepartition=1 --reset

	fi


	echo "###################################"
	echo "######  EDL Flash Done!!!  ########"
	echo "###################################"
}

function print_usage {
	echo 'Usage'
	echo 'edl-flash <platform>'
}

supported="8916 8936 8956 8976 8992 8996"

function _comp_edl_flash {
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
	compctl -K _compzsh edl-flash
else
	shopt -s progcomp
	complete -F _comp_edl_flash edl-flash
fi

