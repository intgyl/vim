version=`cat /etc/issue |  awk '{print$2}' | awk -F '.' '{print$1}'`
echo "ubuntu $version"

if [ $version -lt 16 ]
then
	apt="apt-get"
else
	apt="apt"
fi

sudo $apt install -y axel
sudo $apt install -y git
sudo $apt install -y gitg
sudo $apt install -y clangd

#intercept-build-14 make
sudo $apt install -y clang-tools

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

mkdir -p $HOME/.config/gitui

ln -s $HOME/.vim/config/key_bindings.ron $HOME/.config/gitui/key_bindings.ron

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
sudo $apt install -y vim

#indent
sudo $apt install -y indent

sudo $apt install -y universal-ctags
sudo $apt install -y cscope

sudo cp $HOME/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
sudo $apt install -y minicom
sudo $apt install -y lrzsz

#easystroke
#sudo $apt install -y easystroke
#ln -s $HOME/.vim/soft_config/easystroke/ .easystroke

#samba
sudo $apt install -y samba
sudo $apt install -y cifs-utils

#ccache
sudo $apt install -y ccache

#ssh server
sudo $apt install -y openssh-server

#stardict
sudo $apt install -y stardict
# sudo rm /usr/share/stardict/dic -rf
# sudo ln -s $HOME/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
sudo $apt install -y android-tools-adb
sudo $apt install -y android-tools-fastboot
sudo usermod -a -G audio `whoami`

#unzip unrar 7z
sudo $apt install -y unzip unrar
sudo $apt install -y p7zip-full

#dos2unix
sudo $apt install -y dos2unix

#meld
sudo $apt install -y meld

#tree
sudo $apt install -y tree

#for goagent
sudo $apt install -y python-vte

#for XX-net
sudo $apt install -y libnss3-tools

#16 editor
sudo $apt install -y hexedit

#gimp
sudo $apt install -y gimp
sudo $apt install -y gparted

#PDF printer :print to pdf format. default out_dir $HOME/PDF/
sudo $apt install -y cups-pdf

# used to modify the noticication
sudo $apt install -y mate-notification-daemon
sudo $apt remove notify-osd

sudo $apt install -y dconf-editor

# sudo add-apt-repository ppa:wiznote-team -y
# sudo $apt update
# sudo $apt install -y wiznote

#sudo $apt install -y compizconfig-settings-manager
#sudo $apt install -y compiz-plugins

#docky
#sudo $apt install -y docky

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
	sudo $apt install -y nautilus-open-terminal
fi

#krusader
#sudo $apt install -y krusader

#codec
sudo $apt intall ubuntu-restricted-extras

#the min window view
#sudo $apt install -y libappindicator1
#sudo apt-add-repository ppa:gurqn/systray-trusty
#sudo $apt update
#sudo $apt upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

#sudo $apt install -y cairo-dock

sudo curl -o /usr/local/bin/imgcat -O https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat && sudo chmod +x /usr/local/bin/imgcat

#Android tools
sudo $apt install -y g++
sudo $apt install -y m4
sudo $apt install -y gperf
sudo $apt install -y gnupg
sudo $apt install -y flex
sudo $apt install -y bison
sudo $apt install -y gperf
sudo $apt install -y build-essential
sudo $apt install -y zip
sudo $apt install -y curl
sudo $apt install -y libc6-dev
sudo $apt install -y libncurses5-dev:i386
sudo $apt install -y x11proto-core-dev
sudo $apt install -y libx11-dev:i386
sudo $apt install -y libreadline6-dev:i386
sudo $apt install -y g++-multilib
sudo $apt install -y mingw32
sudo $apt install -y tofrodos
sudo $apt install -y python-markdown
sudo $apt install -y libxml2-utils
sudo $apt install -y xsltproc
sudo $apt install -y libxml2-utils
sudo $apt install -y libncurses5-dev
sudo $apt install -y libssl-dev
sudo $apt install -y device-tree-compiler
sudo $apt install -y openssl
sudo $apt install -y expect-dev
sudo $apt install -y texinfo
sudo $apt install -y libgmp-dev
sudo $apt install -y libcurl4-openssl-dev
sudo $apt install -y libsystemd-dev
sudo $apt install -y libssl-dev
sudo $apt install -y u-boot-tools
sudo $apt install -y libncurses5
sudo $apt install -y gawk
sudo $apt install -y liblz4-tool
sudo $apt install -y ant daemon expect htop lib32z1 \
	libdatetime-perl liblua5.2-dev  libstring-approx-perl \
	libstring-shellquote-perl libswitch-perl libtext-glob-perl \
	libxml2:i386  libxml-parser-perl lua5.2 mysql-client \
	python-mysqldb subversion xbindkeys  xclip xmlstarlet \
	libssl-dev zlib1g-dev global qemu \
	gcc-arm-linux-gnueabi build-essential gdb-arm-none-eabi \
	gcc-aarch64-linux-gnu trace-cmd kernelshark g++-arm-linux-gnueabi \
	g++-aarch64-linux-gnu libdw-dev systemtap xfsprogs libncursesw5-dev \
	unity-tweak-tool policycoreutils liblz4-tool cflow graphviz gawk

sudo $apt install -y python3 python3-pip
python3 -m pip install meson
python3 -m pip install ninja
sudo apt install -y python3-pyelftools python-pyelftools
# sudo pip3 install meson
# sudo pip3 install ninja
pip3 install 'python-lsp-server[all]'
#openjdk-8-jdk
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo $apt update
sudo $apt install -y openjdk-8-jdk

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal

#tweak
#sudo add-apt-repository ppa:tualatrix/ppa -y
#sudo $apt update
#sudo $apt install -y ubuntu-tweak
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
