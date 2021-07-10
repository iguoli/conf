" common settings
set hlsearch
set number
set relativenumber
set mouse=nicr
set wildmenu
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,uft-16,gbk,gb18030,big5,latin1
set backspace=indent,eol,start
set cursorline
set background=dark
set pastetoggle=<F4>
syntax enable
hi CursorLine cterm=None ctermbg=234

" key mapping
let mapleader = ','
" 使用 `<Space>cmd` 替代 `:cmd` 进入Command-line
nnoremap <Space> :
" 在Normal-mode中直接在光标处进行换行
nnoremap <leader><CR> i<CR><Esc>
" 在Normal-mode中直接换行
nnoremap <leader>o o<Esc>
" 光标后移一个字符
inoremap <leader>l <Esc>la
" 使用<tab>替代:bn在buffers中切换
nnoremap <Tab> :bn<CR> 
nnoremap <S-Tab> :bp<CR> 
" 自动插入当前时间
nnoremap <F3> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
inoremap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" for gVim
if has("win32") || has("win64")
    hi Search gui=None guifg=black guibg=yellow
    set guifont=Monaco\ for\ Powerline:h9:cANSI
    set renderoptions=type:directx,renmode:5
elseif has("gui_running")
    set guifont=Monaco\ for\ Powerline:h12
endif

" vim-plug
call plug#begin('~/.vim/plugged')
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'                " 彩虹括号增强版
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'Yggdroot/indentLine'
Plug 'tell-k/vim-autopep8'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vimcn/vimcdoc'
call plug#end()

" " 设置YCM默认规则
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" " 设置python补全使用的解释器路径
" let g:ycm_python_binary_path = 'python'
" " 设置ycm_server使用的python解释器路径
" " (使用`brew --cellar python`提供的python3版本编译ycm)
" let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
" " 开启语义补全
" let g:ycm_seed_identifiers_with_syntax = 1
" " 开启注释补全
" let g:ycm_complete_in_comments = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" " 开启字符串补全
" let g:ycm_complete_in_strings = 1
" " 完成补全后自动关闭预览窗口
" let g:ycm_autoclose_preview_window_after_completion = 0
" " 离开插入模式后自动关闭预览窗口
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_filetype_blacklist = {}
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>g :YcmCompleter GoTo<CR>
" nnoremap <leader>r :YcmCompleter GoToReferences<CR>
" nnoremap <leader>t :YcmCompleter GetDoc<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<leader><Tab>"
let g:UltiSnipsJumpForwardTrigger = "<leader><Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<leader><S-Tab>"
let g:UltiSnipsListSnippets = "<C-l>"

"设置vim-airline
let g:airline_theme = 'simple'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" 缩进指示线
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_conceallevel = 2
let g:indentLine_concealcursor = 'nc'

" autopep8设置
let g:autopep8_disable_show_diff = 1

" Syntastics设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = '--ignore=E501'

" NERD COMMENTER设置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" 彩虹括号设置
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"
