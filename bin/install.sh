
sudo apt-get install axel -y --force-yes
sudo apt-get install git -y --force-yes
cd ~
#git use English
#echo alias git=\'LANG=en_GB git\' >> ~/.bashrc

mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
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

#add my tools
echo "source ~/.vim/bin/source.rc" >> ~/.bashrc

#add apt-fast
sudo cp .vim/bin/other/apt-fast /usr/bin/
sudo chmod 755 /usr/bin/apt-fast

#vim
apt-fast install vim -y --force-yes

apt-fast install exuberant-ctags -y --force-yes
apt-fast install cscope -y --force-yes

sudo cp ~/.vim/bin/other/vim.desktop /usr/share/applications/
sudo sed -i 's/gedit/vim/g' /etc/gnome/defaults.list

#UART DEBUG
apt-fast install minicom -y --force-yes

#easystroke
#apt-fast install easystroke -y --force-yes
#ln -s ~/.vim/soft_config/easystroke/ .easystroke

#samba
apt-fast install samba -y --force-yes
apt-fast install cifs-utils -y --force-yes

#ccache
apt-fast install ccache -y --force-yes

#ssh server
apt-fast install openssh-server -y --force-yes

#stardict
apt-fast install stardict -y --force-yes
sudo rm /usr/share/stardict/dic -rf
sudo ln -s ~/.vim/soft_config/stardict/dic/ /usr/share/stardict/dic

#android adb fastboot
apt-fast install android-tools-adb -y --force-yes
sudo chmod 4755 /usr/bin/adb
apt-fast install android-tools-fastboot -y --force-yes
sudo chmod 4755 /usr/bin/fastboot

#unzip unrar 7z
apt-fast install unzip unrar -y --force-yes
apt-fast install p7zip-full -y --force-yes

#dos2unix
apt-fast install dos2unix -y --force-yes

#tree
apt-fast install tree -y --force-yes
apt-fast install g++ -y --force-yes

#for goagent
apt-fast insatll python-vte -y --force-yes

#for XX-net
apt-fast install libnss3-tools -y --force-yes

#16 editor
apt-fast install hexedit -y --force-yes

#gimp
apt-fast install gimp -y --force-yes

#PDF printer :print to pdf format. default out_dir ~/PDF/
sudo apt-get install cups-pdf -y --force-yes

#docky
#apt-fast install docky -y --force-yes

#chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#wine
#sudo add-apt-repository ppa:ubuntu-wine/ppa
#sudo apt-get update

#disable automount
#gsettings set org.gnome.desktop.media-handling automount "false"
#dconf write /org/gnome/desktop/media-handling/automount  "false"

#open the terminal on right click
apt-fast install nautilus-open-terminal

#krusader
#apt-fast install krusader -y --force-yes

#codec
apt-fast intall ubuntu-restricted-extras -y --force-yes

#the min window view
apt-fast install libappindicator1
sudo apt-add-repository ppa:gurqn/systray-trusty
sudo apt-get update
sudo apt-get upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

apt-fast insatll cairo-dock -y --force-yes

#Android tools
apt-fast install g++ -y --force-yes
apt-fast install m4 -y --force-yes
apt-fast install gperf -y --force-yes
apt-fast install gnupg -y --force-yes
apt-fast install flex -y --force-yes
apt-fast install bison -y --force-yes
apt-fast install gperf -y --force-yes
apt-fast install build-essential -y --force-yes
apt-fast install zip -y --force-yes
apt-fast install curl -y --force-yes
apt-fast install libc6-dev -y --force-yes
apt-fast install libncurses5-dev:i386 -y --force-yes
apt-fast install x11proto-core-dev -y --force-yes
apt-fast install libx11-dev:i386 -y --force-yes
apt-fast install libreadline6-dev:i386 -y --force-yes
apt-fast install g++-multilib -y --force-yes
apt-fast install mingw32 -y --force-yes
apt-fast install tofrodos -y --force-yes
apt-fast install python-markdown -y --force-yes
apt-fast install libxml2-utils -y --force-yes
apt-fast install xsltproc -y --force-yes
apt-fast install libxml2-utils -y --force-yes
apt-fast install libncurses5-dev -y --force-yes

#scrollbar-mode normal
gsettings set com.canonical.desktop.interface scrollbar-mode normal




#tweak
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update
sudo apt-get install ubuntu-tweak
rm -rf ~/.config/ubuntu-tweak/
sudo ln -s ~/.vim/soft_config/ubuntu-tweak/ ~/.config/ubuntu-tweak/

#caro-dock
sudo add-apt-repository ppa:cairo-dock-team/ppa
sudo apt-get update

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
 #sudo apt-get install libmixlib-config-ruby libmixlib-log-ruby libmixlib-cli-ruby1.9.1 libmixlib-cli-ruby libmixlib-cli-ruby1.8 xlibosmesa-dev xlibmesa-glu-dev  libmixlib-log-ruby1.8 pxlib1 python-xlib libmixlib-authentication-ruby  libmixlib-config-ruby1.8 pxlib-dev libmixlib-authentication-ruby1.8
 #sudo add-apt-repository ppa:mc3man/trusty-media
 #sudo apt-add-repository ppa:noobslab/deepin-sc
 #sudo apt-get update
 #sudo apt-get install deepin-music-player
