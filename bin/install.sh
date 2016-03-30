
sudo apt-get install axel -y --force-yes
sudo apt-get install git -y --force-yes
sudo apt-get install gitg -y --force-yes
cd ~
#git use English
#echo alias git=\'LANG=en_GB git\' >> ~/.bashrc

mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
mv ~/.gvimrc ~/.gvimrc.old
git clone https://github.com/gyl33333/vim ~/.vim

mkdir software
cd software
#git clone https://github.com/goagent/goagent
#git clone https://github.com/huhamhire/huhamhire-hosts
git clone https://github.com/XX-net/XX-Net.git
#cd ~/software/goagent*/local/
#./addto-startup.py

cd ~

ln -s ~/.vim/vimrc .vimrc
ln -s ~/.vim/gvimrc .gvimrc

#add my tools
echo "source ~/.vim/bin/source.rc" >> ~/.bashrc

#sudo echo "gyl ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#vim
sudo apt-get install vim -y --force-yes

sudo apt-get install exuberant-ctags -y --force-yes
sudo apt-get install cscope -y --force-yes

sudo cp ~/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
sudo apt-get install minicom -y --force-yes

#easystroke
#sudo apt-get install easystroke -y --force-yes
#ln -s ~/.vim/soft_config/easystroke/ .easystroke

#samba
sudo apt-get install samba -y --force-yes
sudo apt-get install cifs-utils -y --force-yes

#ccache
sudo apt-get install ccache -y --force-yes

#ssh server
sudo apt-get install openssh-server -y --force-yes

#stardict
sudo apt-get install stardict -y --force-yes
sudo rm /usr/share/stardict/dic -rf
sudo ln -s ~/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
sudo apt-get install android-tools-adb -y --force-yes
sudo chmod 4755 /usr/bin/adb
sudo apt-get install android-tools-fastboot -y --force-yes
sudo chmod 4755 /usr/bin/fastboot

#unzip unrar 7z
sudo apt-get install unzip unrar -y --force-yes
sudo apt-get install p7zip-full -y --force-yes

#dos2unix
sudo apt-get install dos2unix -y --force-yes

#tree
sudo apt-get install tree -y --force-yes
sudo apt-get install g++ -y --force-yes

#for goagent
sudo apt-get insatll python-vte -y --force-yes

#for XX-net
sudo apt-get install libnss3-tools -y --force-yes

#16 editor
sudo apt-get install hexedit -y --force-yes

#gimp
sudo apt-get install gimp -y --force-yes

#PDF printer :print to pdf format. default out_dir ~/PDF/
sudo sudo apt-get install cups-pdf -y --force-yes

sudo sudo apt-get install compizconfig-settings-manager
sudo sudo apt-get install compiz-plugins

#docky
#sudo apt-get install docky -y --force-yes

#chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#wine
#sudo add-apt-repository ppa:ubuntu-wine/ppa
#sudo sudo apt-get update

#disable automount
#gsettings set org.gnome.desktop.media-handling automount "false"
#dconf write /org/gnome/desktop/media-handling/automount  "false"

#open the terminal on right click
sudo apt-get install nautilus-open-terminal

#krusader
#sudo apt-get install krusader -y --force-yes

#codec
sudo apt-get intall ubuntu-restricted-extras -y --force-yes

#the min window view
sudo apt-get install libappindicator1
sudo apt-add-repository ppa:gurqn/systray-trusty
sudo sudo apt-get update
sudo sudo apt-get upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

sudo apt-get insatll cairo-dock -y --force-yes

#Android tools
sudo apt-get install g++ -y --force-yes
sudo apt-get install m4 -y --force-yes
sudo apt-get install gperf -y --force-yes
sudo apt-get install gnupg -y --force-yes
sudo apt-get install flex -y --force-yes
sudo apt-get install bison -y --force-yes
sudo apt-get install gperf -y --force-yes
sudo apt-get install build-essential -y --force-yes
sudo apt-get install zip -y --force-yes
sudo apt-get install curl -y --force-yes
sudo apt-get install libc6-dev -y --force-yes
sudo apt-get install libncurses5-dev:i386 -y --force-yes
sudo apt-get install x11proto-core-dev -y --force-yes
sudo apt-get install libx11-dev:i386 -y --force-yes
sudo apt-get install libreadline6-dev:i386 -y --force-yes
sudo apt-get install g++-multilib -y --force-yes
sudo apt-get install mingw32 -y --force-yes
sudo apt-get install tofrodos -y --force-yes
sudo apt-get install python-markdown -y --force-yes
sudo apt-get install libxml2-utils -y --force-yes
sudo apt-get install xsltproc -y --force-yes
sudo apt-get install libxml2-utils -y --force-yes
sudo apt-get install libncurses5-dev -y --force-yes

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal




#tweak
sudo add-apt-repository ppa:tualatrix/ppa
sudo sudo apt-get update
sudo sudo apt-get install ubuntu-tweak
rm -rf ~/.config/ubuntu-tweak/
sudo ln -s ~/.vim/soft_config/ubuntu-tweak/ ~/.config/ubuntu-tweak/

#caro-dock
sudo add-apt-repository ppa:cairo-dock-team/ppa
sudo sudo apt-get update

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

echo "进入ubutun麒麟官网，下载并安装搜狗输入法。"
echo "安装完毕后，打开系统设置-->languageSupport-->keyboard input method system： fcitx"

#install deepin music
 #sudo sudo apt-get install libmixlib-config-ruby libmixlib-log-ruby libmixlib-cli-ruby1.9.1 libmixlib-cli-ruby libmixlib-cli-ruby1.8 xlibosmesa-dev xlibmesa-glu-dev  libmixlib-log-ruby1.8 pxlib1 python-xlib libmixlib-authentication-ruby  libmixlib-config-ruby1.8 pxlib-dev libmixlib-authentication-ruby1.8
 #sudo add-apt-repository ppa:mc3man/trusty-media
 #sudo apt-add-repository ppa:noobslab/deepin-sc
 #sudo sudo apt-get update
 #sudo sudo apt-get install deepin-music-player
