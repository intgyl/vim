version=`cat /etc/issue |  awk '{print$2}' | awk -F '.' '{print$1}'`
echo "ubuntu $version"

if [ $version -lt 16 ]
then
	apt="apt-get"
else
	apt="apt"
fi

sudo $apt install axel
sudo $apt install git
sudo $apt install gitg
cd $HOME
#git use English
#echo alias git=\'LANG=en_GB git\' >> $HOME/.bashrc

#mv $HOME/.vim $HOME/.vim.old
#mv $HOME/.vimrc $HOME/.vimrc.old
#mv $HOME/.gvimrc $HOME/.gvimrc.old
#git clone https://github.com/intgyl/vim $HOME/.vim

#mkdir software
#cd software
#git clone https://github.com/goagent/goagent
#git clone https://github.com/huhamhire/huhamhire-hosts
#git clone https://github.com/XX-net/XX-Net.git
#cd $HOME/software/goagent*/local/
#./addto-startup.py

cd $HOME

ln -s $HOME/.vim/config/vimrc .vimrc
ln -s $HOME/.vim/config/gvimrc .gvimrc
ln -s $HOME/.vim/config/inputrc .inputrc
ln -s $HOME/.vim/config/tigrc .tigrc

#add my tools
echo "source $HOME/.vim/bin/source.rc" >> $HOME/.bashrc

#sudo echo "gyl ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
#authorized_keys

#vim
sudo add-apt-repository ppa:jonathonf/vim -y
sudo $apt update
sudo $apt install vim

#indent
sudo $apt install indent

sudo $apt install exuberant-ctags
sudo $apt install cscope

sudo cp $HOME/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
sudo $apt install minicom

#easystroke
#sudo $apt install easystroke
#ln -s $HOME/.vim/soft_config/easystroke/ .easystroke

#samba
sudo $apt install samba
sudo $apt install cifs-utils

#ccache
sudo $apt install ccache

#ssh server
sudo $apt install openssh-server

#stardict
sudo $apt install stardict
# sudo rm /usr/share/stardict/dic -rf
# sudo ln -s $HOME/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
sudo $apt install android-tools-adb
sudo $apt install android-tools-fastboot
sudo usermod -a -G audio `whoami`

#unzip unrar 7z
sudo $apt install unzip unrar
sudo $apt install p7zip-full

#dos2unix
sudo $apt install dos2unix

#meld
sudo $apt install meld

#tree
sudo $apt install tree

#for goagent
sudo $apt install python-vte

#for XX-net
sudo $apt install libnss3-tools

#16 editor
sudo $apt install hexedit

#gimp
sudo $apt install gimp
sudo $apt install gparted

#PDF printer :print to pdf format. default out_dir $HOME/PDF/
sudo $apt install cups-pdf

# used to modify the noticication
sudo $apt install mate-notification-daemon
sudo $apt remove notify-osd

sudo $apt install dconf-editor

# sudo add-apt-repository ppa:wiznote-team -y
# sudo $apt update
# sudo $apt install wiznote

#sudo $apt install compizconfig-settings-manager
#sudo $apt install compiz-plugins

#docky
#sudo $apt install docky

#chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

#wine
#sudo add-apt-repository ppa:ubuntu-wine/ppa -y
#sudo $apt update

#disable automount
#gsettings set org.gnome.desktop.media-handling automount "false"
#dconf write /org/gnome/desktop/media-handling/automount  "false"

#open the terminal on right click

if [ $version -lt 15 ]
then
	sudo $apt install nautilus-open-terminal
fi

#krusader
#sudo $apt install krusader

#codec
sudo $apt intall ubuntu-restricted-extras

#the min window view
#sudo $apt install libappindicator1
#sudo apt-add-repository ppa:gurqn/systray-trusty
#sudo $apt update
#sudo $apt upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

#sudo $apt install cairo-dock

sudo curl -o /usr/local/bin/imgcat -O https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat && sudo chmod +x /usr/local/bin/imgcat

#Android tools
sudo $apt install g++
sudo $apt install m4
sudo $apt install gperf
sudo $apt install gnupg
sudo $apt install flex
sudo $apt install bison
sudo $apt install gperf
sudo $apt install build-essential
sudo $apt install zip
sudo $apt install curl
sudo $apt install libc6-dev
sudo $apt install libncurses5-dev:i386
sudo $apt install x11proto-core-dev
sudo $apt install libx11-dev:i386
sudo $apt install libreadline6-dev:i386
sudo $apt install g++-multilib
sudo $apt install mingw32
sudo $apt install tofrodos
sudo $apt install python-markdown
sudo $apt install libxml2-utils
sudo $apt install xsltproc
sudo $apt install libxml2-utils
sudo $apt install libncurses5-dev
sudo $apt install ant daemon expect htop lib32z1 \
	libdatetime-perl liblua5.2-dev  libstring-approx-perl \
	libstring-shellquote-perl libswitch-perl libtext-glob-perl \
	libxml2:i386  libxml-parser-perl lua5.2 mysql-client \
	python-mysqldb subversion xbindkeys  xclip xmlstarlet \
	libssl-dev zlib1g-dev global qemu libncurses5-dev \
	gcc-arm-linux-gnueabi build-essential gdb-arm-none-eabi \
	gcc-aarch64-linux-gnu trace-cmd kernelshark g++-arm-linux-gnueabi \
	g++-aarch64-linux-gnu libdw-dev systemtap xfsprogs libncursesw5-dev \
	unity-tweak-tool policycoreutils liblz4-tool

#openjdk-8-jdk
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo $apt update
sudo $apt install openjdk-8-jdk

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal

#tweak
#sudo add-apt-repository ppa:tualatrix/ppa -y
#sudo $apt update
#sudo $apt install ubuntu-tweak
#rm -rf $HOME/.config/ubuntu-tweak/
#sudo ln -s $HOME/.vim/soft_config/ubuntu-tweak/ $HOME/.config/ubuntu-tweak/

#caro-dock
# sudo add-apt-repository ppa:cairo-dock-team/ppa -y
# sudo $apt update

#yahei fonts
# sudo mkdir -p /usr/share/fonts/winfonts
# sudo cp $HOME/.vim/bin/winfonts/* /usr/share/fonts/winfonts
# sudo chmod 644 /usr/share/fonts/winfonts/*
# cd /usr/share/fonts/winfonts/
# sudo mkfontscale
# sudo mkfontdir
# sudo fc-cache -fv

cd $HOME
source $HOME/.bashrc
