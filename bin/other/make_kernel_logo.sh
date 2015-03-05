if [ $# != 1 ] ; then
	echo "usage:$0 file.png"
	exit 1
fi
is_png=`file $1 | grep -c "PNG image data"`
if [ $is_png != 1 ];then
	echo $1 is not a png file
	exit 1
fi
exec_file="/usr/bin/pngtopnm"
if [ ! -x $exec_file ]
then echo "$exec_file is not installed, perform this?(y/n)"
    read ops
    case $ops in
         y) if sudo apt-get install netpbm -y --force-yes
               then echo "$exec_file installed"
            else echo "unable to install the $exec_file. you are using sudo?" ; exit
            fi ;;
         n) echo "not possible usage $exec_file" ; exit ;;
    esac
fi


pngtopnm $1 > logo_linux_clut224.pnm
pnmquant 224 logo_linux_clut224.pnm > logo_linux_clut224_tmp.pnm
rm logo_linux_clut224.pnm
pnmtoplainpnm logo_linux_clut224_tmp.pnm > logo_linux_clut224.ppm
rm logo_linux_clut224_tmp.pnm
echo "target=`pwd`/logo_linux_clut224.ppm"

