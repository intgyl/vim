version=`cat /etc/issue |  awk '{print$2}' | awk -F '.' '{print$1}'`
echo "ubuntu $version"

if [ $version -lt 16 ]
then
	apt="apt-get"
else
	apt="apt"
fi

sudo $apt install axel -y --force-yes
sudo $apt install git -y --force-yes
sudo $apt install gitg -y --force-yes
cd $HOME
#git use English
#echo alias git=\'LANG=en_GB git\' >> $HOME/.bashrc

#mv $HOME/.vim $HOME/.vim.old
#mv $HOME/.vimrc $HOME/.vimrc.old
#mv $HOME/.gvimrc $HOME/.gvimrc.old
#git clone https://github.com/gyl33333/vim $HOME/.vim

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

#vim
sudo $apt install vim -y --force-yes

#indent
sudo $apt install indent -y --force-yes

sudo $apt install exuberant-ctags -y --force-yes
sudo $apt install cscope -y --force-yes

sudo cp $HOME/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
sudo $apt install minicom -y --force-yes

#easystroke
#sudo $apt install easystroke -y --force-yes
#ln -s $HOME/.vim/soft_config/easystroke/ .easystroke

#samba
sudo $apt install samba -y --force-yes
sudo $apt install cifs-utils -y --force-yes

#ccache
sudo $apt install ccache -y --force-yes

#ssh server
sudo $apt install openssh-server -y --force-yes

#stardict
sudo $apt install stardict -y --force-yes
# sudo rm /usr/share/stardict/dic -rf
# sudo ln -s $HOME/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
sudo $apt install android-tools-adb -y --force-yes
sudo $apt install android-tools-fastboot -y --force-yes
sudo usermod -a -G audio `whoami`

#unzip unrar 7z
sudo $apt install unzip unrar -y --force-yes
sudo $apt install p7zip-full -y --force-yes

#dos2unix
sudo $apt install dos2unix -y --force-yes

#meld
sudo $apt install meld -y --force-yes

#tree
sudo $apt install tree -y --force-yes

#for goagent
sudo $apt insatll python-vte -y --force-yes

#for XX-net
sudo $apt install libnss3-tools -y --force-yes

#16 editor
sudo $apt install hexedit -y --force-yes

#gimp
sudo $apt install gimp -y --force-yes
sudo $apt install gparted -y --force-yes

#PDF printer :print to pdf format. default out_dir $HOME/PDF/
sudo $apt install cups-pdf -y --force-yes

# used to modify the noticication
sudo $apt install mate-notification-daemon -y --force-yes
sudo $apt remove notify-osd -y --force-yes

sudo $apt install dconf-editor -y --force-yes

sudo add-apt-repository ppa:wiznote-team -y
sudo $apt update
sudo $apt install wiznote

#sudo $apt install compizconfig-settings-manager
#sudo $apt install compiz-plugins

#docky
#sudo $apt install docky -y --force-yes

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
	sudo $apt install nautilus-open-terminal -y --force-yes
fi

#krusader
#sudo $apt install krusader -y --force-yes

#codec
sudo $apt intall ubuntu-restricted-extras -y --force-yes

#the min window view
#sudo $apt install libappindicator1 -y --force-yes
#sudo apt-add-repository ppa:gurqn/systray-trusty -y --force-yes
#sudo $apt update
#sudo $apt upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

#sudo $apt install cairo-dock -y --force-yes

#Android tools
sudo $apt install g++ -y --force-yes
sudo $apt install m4 -y --force-yes
sudo $apt install gperf -y --force-yes
sudo $apt install gnupg -y --force-yes
sudo $apt install flex -y --force-yes
sudo $apt install bison -y --force-yes
sudo $apt install gperf -y --force-yes
sudo $apt install build-essential -y --force-yes
sudo $apt install zip -y --force-yes
sudo $apt install curl -y --force-yes
sudo $apt install libc6-dev -y --force-yes
sudo $apt install libncurses5-dev:i386 -y --force-yes
sudo $apt install x11proto-core-dev -y --force-yes
sudo $apt install libx11-dev:i386 -y --force-yes
sudo $apt install libreadline6-dev:i386 -y --force-yes
sudo $apt install g++-multilib -y --force-yes
sudo $apt install mingw32 -y --force-yes
sudo $apt install tofrodos -y --force-yes
sudo $apt install python-markdown -y --force-yes
sudo $apt install libxml2-utils -y --force-yes
sudo $apt install xsltproc -y --force-yes
sudo $apt install libxml2-utils -y --force-yes
sudo $apt install libncurses5-dev -y --force-yes
sudo $apt install ant daemon expect htop lib32z1 \
	libdatetime-perl liblua5.2-dev  libstring-approx-perl \
	libstring-shellquote-perl libswitch-perl libtext-glob-perl \
	libxml2:i386  libxml-parser-perl lua5.2 mysql-client \
	python-mysqldb subversion xbindkeys  xclip xmlstarlet \
	libssl-dev zlib1g-dev -y --force-yes

#openjdk-8-jdk
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo $apt update
sudo $apt install openjdk-8-jdk -y --force-yes

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal

#tweak
sudo add-apt-repository ppa:tualatrix/ppa -y
sudo $apt update
sudo $apt install ubuntu-tweak -y --force-yes
rm -rf $HOME/.config/ubuntu-tweak/
sudo ln -s $HOME/.vim/soft_config/ubuntu-tweak/ $HOME/.config/ubuntu-tweak/

#caro-dock
# sudo add-apt-repository ppa:cairo-dock-team/ppa -y
# sudo $apt update

#yahei fonts
sudo mkdir -p /usr/share/fonts/winfonts
sudo cp $HOME/.vim/bin/winfonts/* /usr/share/fonts/winfonts
sudo chmod 644 /usr/share/fonts/winfonts/*
cd /usr/share/fonts/winfonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

cd $HOME
source $HOME/.bashrc
