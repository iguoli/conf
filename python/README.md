# 设置Python工作环境

## 安装pip
```bash
$ sudo apt install -y python3-pip
$ pip3 install --upgrade pip
```

## 使用virtualenv
### 安装
```bash
$ pip install virtualenv
$ virtualenv --version
```

### 创建venv目录
```bash
$ mkdir py3project
$ cd py3project
$ virtualenv -p python3 venv
```

### 激活virtualenv
- Linux系统
```bash
$ source venv/bin/activate
```

- Windows系统
```console
> venv/Scripts/activate
```

### 停用virtualenv
- Linux系统
```bash
$ deactivate
```

- Windows系统
```console
> deactivate
```

## 安装[autoenv](https://github.com/kennethreitz/autoenv)
```bash
$ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
$ echo '# 设置autoenv'
$ echo 'source ~/.autoenv/activate.sh' >> ~/.zshrc
$ echo 'AUTOENV_ENABLE_LEAVE="yes"' >> ~/.zshrc
```

## 配置pip.conf
- Linux系统
```bash
$ mkdir ~/.pip
$ cp ~/conf/python/pip.conf ~/.pip
```

- Windows系统
得**pip.ini**文件到`C:\User\Administrator\pip`目录下
