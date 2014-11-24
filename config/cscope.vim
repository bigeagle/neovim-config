if has("cscope")
    set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
    set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
    set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
    set nocsverb                           "不显示添加数据库是否成功
    " add any database in current directory
endif

"list of reference
nmap <unique> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"definition
nmap <unique> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"call
nmap <unique> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

