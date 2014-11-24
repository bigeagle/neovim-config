execute pathogen#infect()

" UI
if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
    "colorscheme textmate256
    if has("gui_running")
        "colorscheme textmate
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
        "set columns=195
        "set lines=45
    endif " has
endif " exists(...)

set so=10
set number
syntax on
filetype on
filetype plugin on
filetype indent on

set completeopt=longest,menu " preview

if has('mouse')
    set mouse=a
    "set selection=exclusive
    set selectmode=mouse,key
    set nomousehide
endif

set autoindent
set modeline
set cursorline
set cursorcolumn

set shiftwidth=4
set tabstop=4
set softtabstop=4

set showmatch
set nobackup
set nowritebackup

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"设置语法折叠
set foldmethod=syntax
set foldcolumn=0 "设置折叠区域的宽度
set foldlevel=100
" 用空格键来开关折叠
set nofoldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set smartcase
set nohlsearch
set incsearch

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

source ~/.nvim/config/airline.vim
source ~/.nvim/config/python-mode.vim
source ~/.nvim/config/tagbar.vim
source ~/.nvim/config/nerdtree.vim
source ~/.nvim/config/vimwiki.vim
source ~/.nvim/config/cscope.vim
source ~/.nvim/config/syntastic.vim
source ~/.nvim/config/ycm.vim
source ~/.nvim/config/ultisnips.vim
source ~/.nvim/config/rainbow_brackets.vim
source ~/.nvim/config/latex.vim
source ~/.nvim/config/vim-go.vim
source ~/.nvim/config/pandoc.vim
