" eric's settings
set hlsearch
set number
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set path+=/home/eric
set fileencodings=ucs-bom,utf-8,uft-16,gbk,gb18030,big5,latin1

" eric's 'key mapping
let mapleader=","
" 使用;cmd替代:cmd进入Command-line
nnoremap ; :
" 在Normal-mode中直接从光标后进行换行
nnoremap <leader><CR> a<CR><Esc>
" 使用,,替代<Esc>进入Normal-mode
inoremap <leader>, <Esc>
" 自动补全反引号或反括号，并使光标位于括号内
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap <lt> <lt>><Esc>i
" 光标后移一个字符
inoremap <leader><TAB> <Esc>la

" Vundle settings
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" YCM configuration
" 设置YCM默认规则
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>c :YcmCompleter GetDoc<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<F3>"
let g:UltiSnipsJumpBackwardTrigger="<F2>"
let g:UltiSnipsListSnippets="<F5>"
