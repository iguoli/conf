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
        edit /lib/systemd/system/shadowsocks-libev.service and replace ss-server to ss-local.  
        May also need to edit /etc/init.d/shadowsocks-libev and replace ss-server to ss-local

2. Install google-chrome
    - Download deb package from [google](https://www.google.com/chrome/browser/desktop/index.html) directly.  
    or  
    - Install from [google linux repository](https://www.google.com/linuxrepositories/)
    ```
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
    sudo apt update
    sudo apt install google-chrome-stable
    ```
 
 3. Install Vim
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
        python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
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
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer

4. install zsh and oh-my-zsh

