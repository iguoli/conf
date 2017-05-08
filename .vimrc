" eric's settings
set hlsearch
set number
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set path+=/home/`whoami`,/opt/jdk1.8.0_131/src/java/lang,/opt/jdk1.8.0_131/src/java/util,/opt/jdk1.8.0_131/src/java/util/concurrent

" Vundle settings
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" Perform all insert mode completions with Tab
"Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" SuperTab configuration
"let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

" YCM configuration
" cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc'
