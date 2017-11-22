<img align="right" src="https://github.com/guoli100/conf/blob/master/headicon.jpg" width="36" height="36"></img>

# 新装系统环境配置
## 基于APT-based系统(Debian, Ubuntu, Mint, etc.)

### 1. 安装[shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev)
- 从PPA安装[ppa:max-c-lv/shadowsocks-libev](https://launchpad.net/~max-c-lv/+archive/ubuntu/shadowsocks-libev)
```bash
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev
sudo apt update
sudo apt install -y shadowsocks-libev
sudo add-apt-repository -r ppa:max-c-lv/shadowsocks-libev
```
- Systemd shadowsocks-libev service start ss-server by default, if working as client,  
edit `/lib/systemd/system/shadowsocks-libev.service` and replace `ss-server` to `ss-local`.  
May also need to edit `/etc/init.d/shadowsocks-libev` and replace `ss-server` to `ss-local`.

### 2. 安装[Git](https://github.com/git/git)
- 从PPA安装[ppa:git-core/ppa](https://launchpad.net/~git-core/+archive/ubuntu/ppa)
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git
```
- 从源代码安装[git](https://github.com/git/git/blob/master/INSTALL)
```bash
cd
sudo apt install -y build-essential autoconf asciidoc xsltproc
curl -L https://github.com/git/git/archive/master.zip -o git.zip
unzip git.zip
cd git-master
make configure
./configure --prefix=/usr
make all doc
sudo make install install-doc install-html

```

- 配置git
```bash
git config --global user.name guoli100
git config --global user.email golotv@163.com
git config --global credential.helper 'cache --timeout=86400'
git config --global http.proxy socks5://127.0.0.1:1080
git config --global https.proxy socks5://127.0.0.1:1080
git config --global core.editor vim
```

### 3. 安装[Proxychains-ng](https://github.com/rofl0r/proxychains-ng)
```bash
sudo apt install -y build-essential
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config (installs proxychains.conf)
```

### 4. 安装[zsh](https://github.com/zsh-users/zsh) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- 从源代码安装[zsh](https://github.com/zsh-users/zsh/blob/master/INSTALL)
```bash
cd
sudo apt install -y build-essential autoconf perl libncurses5-dev yodl
git clone https://github.com/zsh-users/zsh.git
cd zsh
./Util/preconfig
./configure --prefix=/usr --bindir=/bin
make
sudo make install
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"
```
登出当前shell后再重新登入，启用zsh
- 安装[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
- 安装[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)插件
```bash
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### 5. 安装Vim
- 从PPA安装[ppa:jonathonf/vim](https://launchpad.net/~jonathonf/+archive/ubuntu/vim)(Notice that this Vim don't have python compiled)
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim
```
- 从源代码安装[Vim](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
```bash
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
sudo apt remove vim vim-runtime gvim
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
```
- 安装[Vundle](https://github.com/VundleVim/Vundle.vim)
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/conf/.vimrc ~
vim +PluginInstall +qall
```
- 配置[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)插件
```bash
sudo apt-get install build-essential cmake python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
- 安装[Powerline fonts](https://github.com/powerline/fonts)
```bash
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

### 6. 安装[tmux](https://github.com/tmux/tmux)
```bash
cd
sudo apt install -y build-essential libevent-dev libncurses5-dev autoconf automake pkg-config
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make
sudo make install
```
- 安装[oh-my-tmux](https://github.com/gpakosz/.tmux)
```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf .
cp ~/conf/.tmux.conf.local .
```

### 7. 安装virtualenv
```bash
sudo apt install -y virtualenv
mkdir py3project
cd py3project
virtualenv -p python3 venv
source venv/bin/activate
```

### 8. 安装[google-chrome](https://www.google.com/chrome/browser/desktop/index.html)
- 从[google](https://www.google.com/chrome/browser/desktop/index.html)下载deb安装包
- 或者使用[google linux repository](https://www.google.com/linuxrepositories/)
```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
sudo apt update
sudo apt install -y google-chrome-stable
```

### 9. 设置fontconfig-infinality
- 安装fontconfig-infinality
```bash
sudo add-apt-repository ppa:no1wantdthisname/ppa
sudo apt update
sudo apt install -y fontconfig-infinality
```
- 创建font style (Reference /etc/fonts/infinality/README)
```bash
cd /etc/fonts/infinality/styles.conf.avail
sudo cp -rp linux linux-zh
cd linux-zh
sudo rm 20-aliases-default-linux.conf
sudo cp ~/conf/fontconfig-infinality/20-aliases-default-linux.conf .
sudo cp ~/conf/fontconfig-infinality/62-group-chinese-fonts.conf .
sudo cp ~/conf/fontconfig-infinality/63-group-chinese-fonts-rendering.conf .
```	
- 运行infctl.sh设置style
```bash
cd /etc/fonts/infinality
./infctl.sh setstyle linux-zh
```
