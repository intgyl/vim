adk() {

	tmp=`adb devices | sed -n '/device$/p'`
	if [ -z "$tmp"  ]; then
		echo -e "\nConnect the devce and authorize it\n"
		return
	fi

	host_platform=""
	case `uname` in
		Linux) host_platform=linux ;;
		FreeBSD) host_platform=fbsd ;;
		*CYGWIN*) host_platform=cygwin ;;
		*MINGW*) host_platform=mingw ;;
		Darwin) host_platform=darwin ;;
	esac

	if [ $# -lt 1 ] ; then
		echo "    adk \"cmd\""
		print_adk_usage
		return
	fi

	case "$1" in
	ftyrst)
		adb root > /dev/null
		adb wait-for-device
		adb shell am broadcast -a android.intent.action.MASTER_CLEAR;;

	smartisan-active)
		__skip-first-time;;

	smartisan-launcher)
		adb shell am start -n com.smartisanos.launcher/com.smartisanos.launcher.Launcher;;

	hexdump)
		__adk_hexdump;;

#	flash-dir)
#		__adk_flash-dir;;

#	symbol-dir)
#		__adk_symbol-dir;;

	pmap-all)
		__adk_pmap-all;;

	root)
		__adk_root;;

	cpu-performance)
		__adk_cpu-performance;;

	panic)
		__adk_panic;;

	listapk)
		__adk_listapk;;

	focusedapk)
		__adk_focusedapk;;

	net-shell)
		__adk_net-shell;;

	clk)
		__clk;;

	cpuclk)
		__cpuclk;;

	gpuclk)
		__gpuclk;;

	airplane_on)
		__airplane_mode_on;;

	airplane_off)
		__airplane_mode_off;;

	fps)
		__fps;;

	charging-disble)
		__charging_disable;;

	file-log)

		__file_log $1 $2;;
	dtc)
		__dtc $2;;
	screen-off-time)
		__screen_off_time $2;;

	*)
		print_adk_usage;;
	esac

}

function __adk_root
{
	adb root > /dev/null
	adb wait-for-device
	for string in `adb shell cat /proc/mounts | grep ro, | awk '{printf ("%s@%s\n",$1, $2) }'`; do
		drive=$(echo $string  |awk -F'@' '$0=$1')
		mountpoint=$(echo $string|awk -F'@' '$0=$2')
		adb shell "mount -o remount $drive $mountpoint"
	done
}

function __adk_panic
{
	adb root > /dev/null
	adb wait-for-device
	adb shell "echo c > /proc/sysrq-trigger"
}

function __adk_listapk
{
	adb shell "pm list packages -f" > /tmp/tmplog.pid.$$

	for dir in '/system/app' '/system/priv-app' '/system/vendor' '/system/framework' '/data/app'; do
		echo
		echo dir: $dir
		cat /tmp/tmplog.pid.$$ | grep $dir
	done

	rm -rf /tmp/tmplog.pid.$$
}
function __adk_focusedapk
{
	packages=`adb shell dumpsys activity  | grep mFocusedActivity | awk {'print $4'} | sed 's/\(.*\)\/\.\(.*\)/\1/g'`
	echo "activity: $packages"
	adb shell "pm list packages -f" | grep $packages
}

function __adk_hexdump
{
	dump_path="/data/hexdump"
	#blk_path="/dev/block/bootdevice/by-name"
	blk_path=`adb shell cat /proc/mounts | grep system | awk '{print $1}' | sed "s/\/system//g"`
	adb root > /dev/null
	adb wait-for-device
	adb shell "mkdir $dump_path"
	for partition in `adb shell ls $blk_path | grep -v "system\|cache\|userdata\|udisk"`; do
		partition=`echo "$partition" | tr -d '\r\n'`
		echo "dd if=$blk_path/$partition of=$dump_path/$partition"
		adb shell "dd if=$blk_path/$partition of=$dump_path/$partition"
	done
	adb shell "sync"
	adb pull  $dump_path .
	adb shell "rm -rf $dump_path"
}

function __adk_cpu-performance
{
	adb root > /dev/null
	adb wait-for-device
	adb shell stop thermal-engine
	cpus=0
	cpus=`adb shell cat /proc/cpuinfo | grep processor | wc -l`
	cpus=$((cpus - 1))
	for nb in `seq 0 $cpus`; do
		adb shell "echo performance > /sys/devices/system/cpu/cpu$nb/cpufreq/scaling_governor"
		max_freq=`adb shell cat /sys/devices/system/cpu/cpu$nb/cpufreq/cpuinfo_max_freq`
		adb shell "echo $max_freq > /sys/devices/system/cpu/cpu$nb/cpufreq/scaling_min_freq"
		adb shell "echo $max_freq > /sys/devices/system/cpu/cpu$nb/cpufreq/scaling_max_freq"
	done
}

function __adk_net-shell
{
	tcpport=5555
	adb disconnect
	adb shell svc wifi enable
	adb root > /dev/null
	adb wait-for-device
	adb shell setprop service.adb.tcp.port $tcpport
	ipaddr=`adb shell "ifconfig wlan0" | grep "inet addr" | awk {'print $2'} | sed {"s/\(.*\):\(.*\)/\2/g"}`
	#ip=`adb shell ifconfig wlan0|grep 'inet addr'|awk -F'[ : ]' '{print $13}'`
	# adb tcpip $tcpport
	echo $ipaddr:$tcpport
	adb wait-for-device
	adb connect $ipaddr:$tcpport
	adb -s $ipaddr:$tcpport shell
}

#function __adk_flash-dir
#{
#	webcgi="http://172.16.2.18/cgi-bin/vmlinux-lookup.cgi"
#	version=$(adb shell "cat /proc/version" | grep "Linux version")
#	if [ $host_platform == "cygwin" ] ; then
#		smb_path=$(curl --data-urlencode "version=$version" $webcgi 2> /dev/null | grep "Flashing binary" -A 1 | tail -1)
#		unc_path=$(echo ${smb_path#*smb:})
#		for string in `net use | grep "Microsoft Windows Network" | awk '{printf ("%s@%s\n",$2, $3)}'`; do
#			drive=$(echo $string  |awk -F'@' '$0=$1')
#			map_point=$(echo $string|awk -F'@' '$0=$2'| sed "s/\\\/\//g")
#			echo $unc_path | grep $map_point > /dev/null
#			if [ $? == 0 ]; then
#				#echo $drive $map_point $win_path
#				map_point_regex=$(echo $map_point | sed "s/\//\\\\\//g")
#				drive_regex=$(echo $drive | sed "s/\:/\\\:/g")
#				win_path=$(echo "$unc_path" | sed "s/$map_point_regex/$drive_regex/g")
#				echo $win_path | tee /dev/console | tr '\n' ' ' | clip
#			fi
#		done
#	fi
#}
#
#function __adk_symbol-dir
#{
#	webcgi="http://172.16.2.18/cgi-bin/vmlinux-lookup.cgi"
#	version=$(adb shell "cat /proc/version" | grep "Linux version")
#	if [ $host_platform == "cygwin" ] ; then
#		smb_path=$(curl --data-urlencode "version=$version" $webcgi 2> /dev/null | grep "kernel symbols" -A 1 | tail -1)
#		unc_path=$(echo ${smb_path#*smb:})
#		for string in `net use | grep "Microsoft Windows Network" | awk '{printf ("%s@%s\n",$2, $3)}'`; do
#			drive=$(echo $string  |awk -F'@' '$0=$1')
#			map_point=$(echo $string|awk -F'@' '$0=$2'| sed "s/\\\/\//g")
#			echo $unc_path | grep $map_point > /dev/null
#			if [ $? == 0 ]; then
#				#echo $drive $map_point $win_path
#				map_point_regex=$(echo $map_point | sed "s/\//\\\\\//g")
#				drive_regex=$(echo $drive | sed "s/\:/\\\:/g")
#				win_path=$(echo "$unc_path" | sed "s/$map_point_regex/$drive_regex/g")
#				echo $win_path | tee /dev/console | tr '\n' ' ' | clip
#			fi
#		done
#	fi
#}

function __adk_pmap-all
{
	for pid in `adb shell "ps" | awk '{print $2}' `; do
		cmdline=`adb shell cat /proc/$pid/cmdline`
		if [ -n "$cmdline" ]; then
			adb shell pmap $pid
		fi
	done
}

function __clk {
	while true
	do
		adb wait-for-device
		echo "****************cpu clk***************"
		adb shell "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"
		echo "****************gpu clk***************"
		adb shell "cat /sys/class/kgsl/kgsl-3d0/gpuclk"
		echo "****************gpubusy***************"
		adb shell "cat /sys/class/kgsl/kgsl-3d0/gpubusy"

		sleep 0.5
	done
}

function __cpuclk {
	while true
	do
		adb wait-for-device
		adb shell "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"
		sleep 0.5
	done

}

function __gpuclk {
	while true
	do
		adb wait-for-device
		adb shell "cat /sys/class/kgsl/kgsl-3d0/gpuclk"
		sleep 0.5
	done
}

function __airplane_mode_on {
	adb shell settings put global airplane_mode_on 1
	adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true

}

function __airplane_mode_off {
	adb shell settings put global airplane_mode_on 0
	adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false
}


function __fps {
	adb wait-for-device
	adb shell "while true ; do dumpsys SurfaceFlinger | grep \"vsync period\" ; sleep 0.1 ; done"
}

function __skip-first-time () {

	adbd_string="adbd cannot run as root in production builds"

	adb wait-for-device
	user=`adb root`

	if [ "$user" = "$adbd_string" ]; then
		adb wait-for-device
		adb shell settings put secure user_setup_complete 1
		adb shell settings put global device_provisioned  1
		return
	fi

	adb wait-for-device
	adb shell "am start -n com.smartisanos.setupwizard/com.smartisanos.setupwizard.SetupWizardCompleteActivity"
}

function __charging_disable() {

	adb root > /dev/null
	adb wait-for-device
	adb shell "echo 0 > /sys/class/power_supply/battery/charging_enabled"
}

function __file_log () {

	if [ $# != 2 ]; then
		echo "usage: adk file-log xxx.c"
		return
	fi

	adb root > /dev/null
	adb shell "echo \'file $2 +p\' >  /sys/kernel/debug/dynamic_debug/control"

}

function __dtc() {


	if [ $# != 1 ]; then
		echo "Please input the dtb file"
		echo "adk dtc xxx.dtb"
		return
	fi

	if [ -z `echo $1 | sed 's/^.*\.//'` ]; then
		echo "Please input the dtb file"
		echo "adk dtc xxx.dtb"
		return

	elif [ `echo $1 | sed 's/^.*\.//'` != "dtb" ]; then
		echo "Please input the dtb file"
		echo "adk dtc xxx.dtb"
		return
	fi

	bin_dir=`dirname "$BASH_SOURCE"`
	$bin_dir/dtc_bin -I dtb -O dts -o $(echo $1 | sed 's/\.[^.]*$//').dts $1
}

function __screen_off_time() {

	if [ $# = 0 ]; then
		echo "usage: adk screen-off-time ms"
		return
	fi

	adb shell settings put system screen_off_timeout $1
}


supported_adk="root ftyrst hexdump meminfo pmap-all cpu-performance listapk
		focusedapk panic net-shell clk cpuclk gpuclk airplane_on
		airplane_off fps smartisan-active charging-disble file-log dtc
		screen-off-time"

function _comp_adk {
	local curw
	opts="-a -l -d -h"
	COMPREPLY=()
	curw=${COMP_WORDS[COMP_CWORD]}

	if [[ ${curw} == -*  ]] ; then
		COMPREPLY=( $(compgen -W "${opts}" -- ${curw})  )
		return 0
	fi

	COMPREPLY=($(compgen -W '$supported_adk' -- $curw))

	return 0
}

# ZSH completion command
function _compzsh {
	reply=($(_l))
}

if [ $ZSH_VERSION ]; then
	compctl -K _compzsh adk
else
	shopt -s progcomp
	complete -F _comp_adk adk
fi


function print_adk_usage {

	echo "
	1. root
	   将adb重启为root权限，并且remount所有ro分区为rw

	2. ftyrst
	   执行恢复出厂设置

	3. hexdump
	   将userdata，system，cache之外的分区，都已二进制形式dump到当前目录中

	4. meminfo
	   监控系统的内存状态

	5. pmap-all
	   把所有用户进程的pmap打印出来，用来查看动态库被哪些进程引用了

	6. cpu-performance
	   将Android设置成高性能状态，锁定在最高频。

	7. listapk
	   打印Android当前所有安装的apk

	8. focusedapk
	   打印当前主界面的apk名称

	9. panic
	   触发panic

	10. net-shell
	   建立一个adb net的shell通道，可以不依赖USB进行调试

	11. fps
	   获取当前fps

	12. clk
	   cpuclk gpuclk gpubusy

	13. airplane_on
	   打开飞行模式

	14. airplane_off
	   关闭飞行模式

	15. smartisan-active

	16. charging-disble

	17. file-log
	   打开指定文件dmesg log
	   usage: adk file-log xxx.c

	18. dtc
	   反编译dtb文件
	   usage: adk dtc xxx.dtb

	19. screen-off-time
	   配置灭屏时间
	   usage: adk screen-off-time ms

	"
}

