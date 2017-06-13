<img align="right" src="https://github.com/guoli100/conf/blob/master/headicon.jpg" width="36" height="36"></img>

# Setup my working environment step by step
## For APT-based system(Debian, Ubuntu, Mint, etc.)

1. Install [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev)
    - Install from ppa:max-c-lv/shadowsocks-libev
    ```
    sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev
    sudo apt update
    sudo apt install shadowsocks-libev
    ```
    - Systemd shadowsocks-libev service start ss-server by default, if working as client,  
        edit `/lib/systemd/system/shadowsocks-libev.service` and replace `ss-server` to `ss-local`.  
        May also need to edit `/etc/init.d/shadowsocks-libev` and replace `ss-server` to `ss-local`.

2. Install [google-chrome](https://www.google.com/chrome/browser/desktop/index.html)
    - Download deb package from [google](https://www.google.com/chrome/browser/desktop/index.html) directly.  
    or  
    - Install from [google linux repository](https://www.google.com/linuxrepositories/)
    ```
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
    sudo apt update
    sudo apt install google-chrome-stable
    ```
3. Install [Git](https://github.com/git/git)
	- Install git from [ppa:git-core/ppa](https://launchpad.net/~git-core/+archive/ubuntu/ppa)
	```
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt update
	sudo apt install git
	```
	- Install [git](https://github.com/git/git/blob/master/INSTALL) from source
	```
	cd
	sudo apt install build-essential autoconf asciidoc xsltproc
	curl -L https://github.com/git/git/archive/master.zip -o git.zip
	unzip git.zip
	cd git-master
	make configure
	./configure --prefix=/usr
	make all doc
	sudo make install install-doc install-html

	```
	- Config git
	```
	git config --global user.name guoli100
	git config --global user.email golotv@163.com
	git config --global credential.helper 'cache --timeout=86400'
	git config --global http.proxy socks5://127.0.0.1:1080
	git config --global https.proxy socks5://127.0.0.1:1080
	git config --global core.editor vim
	```
 
4. Install Vim
    - Install from [ppa:jonathonf/vim](https://launchpad.net/~jonathonf/+archive/ubuntu/vim)(Notice that this Vim don't have python compiled)
    ```
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim
    ```
    - [Building Vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
    ```
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
    - [Setup Vundle](https://github.com/VundleVim/Vundle.vim)
    ```
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp ~/conf/.vimrc ~
    vim +PluginInstall +qall
    ```
    - Configure [YouCompleteMe plugin](https://github.com/Valloric/YouCompleteMe)
    ```
    sudo apt-get install build-essential cmake python-dev python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    ```
	- Install [Powerline fonts](https://github.com/powerline/fonts)
	```
	cd ~
	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh
	```

5. Install [zsh](https://github.com/zsh-users/zsh) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
	- Install [zsh](https://github.com/zsh-users/zsh/blob/master/INSTALL) from source
	```
	cd
	sudo apt install build-essential autoconf perl libncurses5-dev yodl
	git clone https://github.com/zsh-users/zsh.git
	cd zsh
	./Util/preconfig
	./configure --prefix=/usr --bindir=/bin
	make
	sudo make install
	which zsh | sudo tee -a /etc/shells
	chsh -s "$(which zsh)"
	```
	Log out and login back again to use new defaul shell.
	- Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
	```
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	```
	- Install [zsh-autosuggestions plugin](https://github.com/zsh-users/zsh-autosuggestions)
	```
	git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	```
	

6. Install [tmux](https://github.com/tmux/tmux)
	- Install [tmux](https://github.com/tmux/tmux)
	```
	cd
	sudo apt install build-essential libevent-dev libncurses5-dev autoconf automake pkg-config
	git clone https://github.com/tmux/tmux.git
	cd tmux
	sh autogen.sh
	./configure
	make
	sudo make install
	```
	- Install [oh-my-tmux](https://github.com/gpakosz/.tmux)
	```
	cd
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf .
	cp ~/conf/.tmux.conf.local .
	```
