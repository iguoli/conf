# 设置Python工作环境

### 安装pip
```bash
$ sudo apt install -y python3-pip
$ pip3 install --upgrade pip
```

### 安装virtualenv
```bash
$ pip install virtualenv
$ virtualenv --version
```

### 安装[autoenv](https://github.com/kennethreitz/autoenv)
```bash
$ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
$ echo 'source ~/.autoenv/activate.sh' >> ~/.zshrc
$ echo 'AUTOENV_ENABLE_LEAVE="yes" >> ~/.zshrc'
```

### 配置pip.conf
```bash
$ mkdir ~/.pip
$ cp ~/conf/python/pip.conf ~/.pip
```
