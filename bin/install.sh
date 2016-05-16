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
cd ~
#git use English
#echo alias git=\'LANG=en_GB git\' >> ~/.bashrc

#mv ~/.vim ~/.vim.old
#mv ~/.vimrc ~/.vimrc.old
#mv ~/.gvimrc ~/.gvimrc.old
#git clone https://github.com/gyl33333/vim ~/.vim

#mkdir software
#cd software
#git clone https://github.com/goagent/goagent
#git clone https://github.com/huhamhire/huhamhire-hosts
#git clone https://github.com/XX-net/XX-Net.git
#cd ~/software/goagent*/local/
#./addto-startup.py

cd ~

ln -s ~/.vim/vimrc .vimrc
ln -s ~/.vim/gvimrc .gvimrc

#add my tools
echo "source ~/.vim/bin/source.rc" >> ~/.bashrc

#sudo echo "gyl ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#vim
sudo $apt install vim -y --force-yes

sudo $apt install exuberant-ctags -y --force-yes
sudo $apt install cscope -y --force-yes

sudo cp ~/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
sudo $apt install minicom -y --force-yes

#easystroke
#sudo $apt install easystroke -y --force-yes
#ln -s ~/.vim/soft_config/easystroke/ .easystroke

#samba
sudo $apt install samba -y --force-yes
sudo $apt install cifs-utils -y --force-yes

#ccache
sudo $apt install ccache -y --force-yes

#ssh server
sudo $apt install openssh-server -y --force-yes

#stardict
sudo $apt install stardict -y --force-yes
sudo rm /usr/share/stardict/dic -rf
sudo ln -s ~/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
sudo $apt install android-tools-adb -y --force-yes
sudo chmod 4755 /usr/bin/adb
sudo $apt install android-tools-fastboot -y --force-yes
sudo chmod 4755 /usr/bin/fastboot

#unzip unrar 7z
sudo $apt install unzip unrar -y --force-yes
sudo $apt install p7zip-full -y --force-yes

#dos2unix
sudo $apt install dos2unix -y --force-yes

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

#PDF printer :print to pdf format. default out_dir ~/PDF/
sudo $apt install cups-pdf -y --force-yes

#sudo $apt install compizconfig-settings-manager
#sudo $apt install compiz-plugins

#docky
#sudo $apt install docky -y --force-yes

#chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

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

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal

#tweak
sudo add-apt-repository ppa:tualatrix/ppa -y
sudo $apt update
sudo $apt install ubuntu-tweak -y --force-yes
rm -rf ~/.config/ubuntu-tweak/
sudo ln -s ~/.vim/soft_config/ubuntu-tweak/ ~/.config/ubuntu-tweak/

#caro-dock
sudo add-apt-repository ppa:cairo-dock-team/ppa -y
sudo $apt update

#yahei fonts
sudo mkdir -p /usr/share/fonts/winfonts
sudo cp ~/.vim/bin/winfonts/* /usr/share/fonts/winfonts
sudo chmod 644 /usr/share/fonts/winfonts/*
cd /usr/share/fonts/winfonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

cd ~
source ~/.bashrc

#install deepin music
#sudo $apt install libmixlib-config-ruby libmixlib-log-ruby libmixlib-cli-ruby1.9.1 libmixlib-cli-ruby libmixlib-cli-ruby1.8 xlibosmesa-dev xlibmesa-glu-dev  libmixlib-log-ruby1.8 pxlib1 python-xlib libmixlib-authentication-ruby  libmixlib-config-ruby1.8 pxlib-dev libmixlib-authentication-ruby1.8
#sudo add-apt-repository ppa:mc3man/trusty-media -y
#sudo apt-add-repository ppa:noobslab/deepin-sc
#sudo $apt update
#sudo $apt install deepin-music-player

