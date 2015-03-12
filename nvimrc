let g:python_host_prog='/usr/bin/python2.7'

set nocompatible
filetype off
set runtimepath+=~/.nvim/bundle/Vundle.vim
call vundle#begin("~/.nvim/bundle")
" Plugin List
Plugin 'gmarik/Vundle.vim'
" Plugin 'Yggdroot/LeaderF'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mattn/emmet-vim'
Plugin 'bigeagle/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'lervag/vim-latex'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'tpope/vim-fugitive'
Plugin 'jrosiek/vim-mark'
Plugin 'caio/querycommandcomplete.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'zaiste/tmux.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'lepture/vim-jinja'
Plugin 'file://$HOME/.nvim/bundle/colorpicker'

call vundle#end()

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

set list lcs=tab:\¦\   

if has("autocmd")  " go back to where you exited
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

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
set directory=~/.nvim/.swapfiles//

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
set ignorecase
set nohlsearch
set incsearch

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O


au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env python2"
        let coding = "# -*- coding:utf-8 -*-"
        let future = "from __future__ import print_function, division, unicode_literals"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(1, coding)
        call append(2, future)
        call append(4, cfg)
    endif
    normal ''
endfunction


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
source ~/.nvim/config/scss.vim
source ~/.nvim/config/querycommand.vim
source ~/.nvim/config/localvimrc.vim
