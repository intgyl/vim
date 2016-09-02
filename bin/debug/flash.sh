flash() {
	value=$@

	if [ $# = 0 ]; then
		echo "Please enter the partition"
		return
	fi

	if [ $1 = "." ]; then

		if [ $OUT ]; then
			echo "ANDROID_PRODUCT_OUT = $OUT"
			if [ "$OUT" != "$PWD" ]; then
				cd $OUT
			fi
		else
			echo "Please enter the code directory, setup the env"
			return
		fi
	fi

	if [ -z "`sudo fastboot devices`"  ]; then

		if [ -z "`adb devices`"  ]; then
			echo "No device connected"
			return
		else
			echo "Reboot to fastboot mode"
			adb reboot bootloader
		fi
	fi

	for i in ${value[@]}
	do
		case "$i" in

			boot)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i boot.img
				;;
			system)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i system.img
				;;
			recovery)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i recovery.img
				;;
			userdata)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i userdata.img
				;;
			cache)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i cache.img
				;;
			aboot|abootbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i emmc_appsboot.mbn
				;;
			rpm|rpmbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i rpm.mbn
				;;
			tz|tzbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i tz.mbn
				;;
			hyp|hypbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i hyp.mbn
				;;
			pmic|pmic.bak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i pmic.elf
				;;
			modem)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i NON-HLOS.bin
				;;
			dsp)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i adspso.bin
				;;
			mdtp)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i mdtp.img
				;;
			keymaster|keymasterbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i keymaster.mbn
				;;
			cmnlib|cmnlibbak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i cmnlib.mbn
				;;
			cmnlib64|cmnlib64bak)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i cmnlib64.mbn
				;;
			PrimaryGPT)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i gpt_main4.bin
				;;
			BackupGPT)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i gpt_backup4.bin
				;;
			bluetooth)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i BTFM.bin
				;;
			persist)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i persist.img
				;;
			security)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i security.img
				;;
			splash)
				echo -e "\nflash $i\n"
				sudo fastboot flash $i splash.img
				;;
			.)
				;;
			*)
				echo -e "\n'$i' is not supported\n"
		esac

	done


}

supported_partition="boot system recovery userdata cache aboot abootbak rpm rpmbak
		tz tzbak hyp hypbak pmic pmic.bak modem dsp mdtp keymaster keymasterbak
		cmnlib cmnlibbak cmnlib64 cmnlib64bak PrimaryGPT BackupGPT bluetooth
		persist security splash"


function _comp_flash {
	local curw
	opts="-a -l -d -h"
	COMPREPLY=()
	curw=${COMP_WORDS[COMP_CWORD]}

	if [[ ${curw} == -*  ]] ; then
		COMPREPLY=( $(compgen -W "${opts}" -- ${curw})  )
		return 0
	fi

	COMPREPLY=($(compgen -W '$supported_partition' -- $curw))

	return 0
}

# ZSH completion command
function _compzsh {
	reply=($(_l))
}

if [ $ZSH_VERSION ]; then
	compctl -K _compzsh flash
else
	shopt -s progcomp
	complete -F _comp_flash flash
fi
