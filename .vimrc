" common settings
set hlsearch
set number
set relativenumber
set mouse=nicr
set wildmenu
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,uft-16,gbk,gb18030,big5,latin1
set backspace=indent,eol,start
set cursorline
set pastetoggle=<F4>
set background=dark
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
" 在Normal-mode中格式化json文本
nnoremap <leader>j :set ft=json<CR>:%!jq .<CR>
" 在 Normal-mode 中以文件类型进行折叠
nnoremap <leader>z :set fdm=syntax<CR>
" 使用<tab>替代:bn在buffers中切换
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" 自动插入当前时间
nnoremap <F3> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
inoremap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" vim-plug
call plug#begin('~/.vim/plugged')
" Utilities
Plug 'Exafunction/codeium.vim'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'schickling/vim-bufonly'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'                " 彩虹括号增强版
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
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
        set guifont=Monaco\ for\ Powerline:h14
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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<leader><Tab>"
let g:UltiSnipsJumpForwardTrigger = "<leader><Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<leader><S-Tab>"
let g:UltiSnipsListSnippets = "<C-l>"

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
