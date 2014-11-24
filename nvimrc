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

nmap tl :TlistToggle<cr>
nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O
