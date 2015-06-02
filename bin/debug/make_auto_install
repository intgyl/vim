#!/bin/bash

# check env
if [ ! -x /usr/bin/7z ]
then echo "7z is not installed, perform this?(y/n)"
	read ops
	case $ops in
		y) if sudo apt-get install p7zip-full -y --force-yes
		then echo "7z installed"
		else echo "unable to install the 7z. you are using sudo?" ; exit
		fi ;;
	n) echo "not possible usage 7z" ; exit ;;
esac
fi

# check input ...
if [ $# -lt 2 ]; then
	echo \$#=$#
	echo  'Usage:'
	echo  $0 a.sh b.bin
	exit 1
fi
file_sh=$1
check_sh=`file $1| grep -wc shell`
echo check sh...
if [ x$check_sh != x1 ]; then
	echo $1 is not a shell,please check it
	exit 1
fi

# 7z input into a 7z
echo making image now ...
temp_7z_src=`mktemp`.7z
7z a $temp_7z_src $@ > /dev/null
md5_sum=`md5sum $temp_7z_src| awk '{print $1}'`

# add a auto unpack header shell
sed -n '/__START__$/,/__END__$/p' $0 > auto.bin

#change file name in auto.bin
sed -i "s/_MD5_7Z_/$md5_sum/g" auto.bin
lines_sh=`wc -l auto.bin | awk '{print $1}'`
lines_sh=$(($lines_sh+1))
sed -i "s/_LINE_/$lines_sh/g" auto.bin
sed -i "s/_FILE_/$file_sh/g" auto.bin
sed -i "s/__START__//g" auto.bin
sed -i "s/__END__//g" auto.bin

#make all the file into a auto_unpack bin file
cat $temp_7z_src >> auto.bin

#clean the env
rm $temp_7z_src

#add exc permission
chmod +x auto.bin

#exit here
echo Success, file is auto.bin
exit 0











#!/bin/bash__START__
# check env
if [ ! -x /usr/bin/7z ]
then echo "7z is not installed, perform this?(y/n)"
	read ops
	case $ops in
		y) if sudo apt-get install p7zip-full -y --force-yes
		then echo "7z installed"
		else echo "unable to install the 7z. you are using sudo?" ; exit
		fi ;;
	n) echo "not possible usage apt-fast" ; exit ;;
esac
fi
temp_7z=`mktemp`.7z
temp_dir=`mktemp -d`
md5_7z=_MD5_7Z_
tail -n +_LINE_ $0 > $temp_7z
md5out=`md5sum $temp_7z | awk '{print $1}'`
if [ $md5out != $md5_7z ]; then
	echo unpack $0 error, exit..
	rm $temp_7z
	exit 1
fi
7z x $temp_7z -o$temp_dir > /dev/null
export PATH=$temp_dir:$PATH
rm $temp_7z
chmod +x $temp_dir/_FILE_
_FILE_ $@
if [ $? != 0 ]; then
	echo _FILE_ error found, exit..
	rm $temp_dir -rf
	exit 1
fi
echo _FILE_ over, Success
rm $temp_dir -rf
echo success
exit 0__END__
