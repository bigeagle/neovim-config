let python_highlight_all = 1
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python setlocal cc=80

let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#usages_command = "<leader>u"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#completions_enabled = 0
