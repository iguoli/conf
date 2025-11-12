" enable mouse
set mouse=a

" enable line number and relative line number
set number
set relativenumber

" use space instead of tab
set expandtab

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set softtabstop=2

" copy indent from current line when starting a new line
set autoindent

" normally 'autoident' should also be on when using 'smartindent'
" indent after a line ending with a '{'
" indent after a line starting with a keywords like 'if',
" 'while', 'for', 'function', etc.
" indent before a line starting with '}'
set smartindent

" Case insensitive search
set ignorecase

" Case sensitive search when using capital letters
set smartcase

" enable highlight search
set hlsearch

" highlight current line
set cursorline

set wildmenu
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,uft-16,gbk,gb18030,big5,latin1
set backspace=indent,eol,start
set pastetoggle=<F4>
set background=dark
hi CursorLine cterm=None ctermbg=234
syntax enable

" key mapping
let mapleader = ','

" 使用 `<Space>cmd` 替代 `:cmd` 进入Command-line
nnoremap <Space> :

" 在Normal-mode中格式化json文本
nnoremap <leader>j :set ft=json<CR>:%!jq .<CR>

" 在 Normal-mode 中以文件类型进行折叠
nnoremap <leader>z :set fdm=syntax<CR>

" 使用<tab>替代:bn在buffers中切换
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" vim-plug
call plug#begin('~/.vim/plugged')
" Utilities
Plug 'Exafunction/codeium.vim'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'                " 彩虹括号增强版
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Program enhancement
Plug 'Yggdroot/indentLine'
Plug 'tell-k/vim-autopep8'
Plug 'scrooloose/syntastic'
Plug 'vimcn/vimcdoc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" for gVim
if has("gui_running")
    if has('mac')
        set guifont=CamingoCode\ Nerd\ Font:h14
    elseif has("win32") || has("win64")
        hi Search gui=None guifg=black guibg=yellow
        set guifont=CamingoCode\ Nerd\ Font:h11:cANSI
        set guifontwide=NSimSun:h11
        set renderoptions=type:directx,renmode:5
    endif

    set lines=35
    set columns=100
    colorscheme dracula
endif

" the cursor style
if exists('$TMUX')
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[2 q"
endif

"设置vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.colnr = 'col:'
let g:airline_symbols.dirty='⚡'

" 缩进指示线
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_conceallevel = 2
let g:indentLine_concealcursor = 'c'

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
