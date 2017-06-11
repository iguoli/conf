<img align="right" src="https://github.com/guoli100/conf/blob/master/headicon.jpg" width="36" height="36"></img>

# Setup my working environment step by step
## For APT-based system(Debian, Ubuntu, Mint, etc.)

1. Install [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev)
    ```
    sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev
    sudo apt update
    sudo apt install shadowsocks-libev
    ```

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
 
 3. Install vim

install zsh and oh-my-zsh

