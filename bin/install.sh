
#准备下载环境，安装下载工具
sudo apt-get install axel -y --force-yes

#下载vim配置即一些脚本
sudo apt-get install git -y --force-yes
cd ~
#git 使用英文提示
echo alias git=\'LANG=en_GB git\' >> ~/.bashrc

mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
git clone https://github.com/gyl33333/vim ~/.vim

mkdir software
cd software
git clone https://github.com/goagent/goagent
git clome  https://github.com/huhamhire/huhamhire-hosts

cd ~/sofware/goagent*/local/
./addto-startup.py

cd ~

ln -s ~/.vim/vimrc .vimrc
sudo ln -s /usr/bin/astyle ~/.vim/bin/astyle

#add PATH
echo "export PATH=~/.vim/bin:$PATH" >> ~/.bashrc

#add easy sh
echo "source ~/.vim/bin/source_file/source.rc" >> ~/.bashrc

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
apt-fast install easystroke -y --force-yes
ln -s ~/.vim/soft_config/easystroke/ .easystroke

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

#16进制编辑器
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

#禁用自动挂载
#gsettings set org.gnome.desktop.media-handling automount "false"
#dconf write /org/gnome/desktop/media-handling/automount  "false"

#在文件夹中右键打开终端
apt-fast install nautilus-open-terminal

#krusader
#apt-fast install krusader -y --force-yes

#解码器
apt-fast intall ubuntu-restricted-extras -y --force-yes

#the min window view
apt-fast install libappindicator1
sudo apt-add-repository ppa:gurqn/systray-trusty
sudo apt-get update
sudo apt-get upgrade

git config --global core.editor vim
git config --global merge.tool vimdiff

#编译android需要安装的一些软件
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

#滚动条
gsettings set com.canonical.desktop.interface scrollbar-mode normal




#tweak
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update
sudo apt-get install ubuntu-tweak


echo "进入ubutun麒麟官网，下载并安装搜狗输入法。"
echo "安装完毕后，打开系统设置-->languageSupport-->keyboard input method system： fcitx"
#安装深度音乐
 sudo apt-get install libmixlib-config-ruby libmixlib-log-ruby libmixlib-cli-ruby1.9.1 libmixlib-cli-ruby libmixlib-cli-ruby1.8 xlibosmesa-dev xlibmesa-glu-dev  libmixlib-log-ruby1.8 pxlib1 python-xlib libmixlib-authentication-ruby  libmixlib-config-ruby1.8 pxlib-dev libmixlib-authentication-ruby1.8
 sudo add-apt-repository ppa:mc3man/trusty-media
 sudo apt-add-repository ppa:noobslab/deepin-sc
 sudo apt-get update
 sudo apt-get install deepin-music-player
