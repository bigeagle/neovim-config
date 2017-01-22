let g:go_auto_type_info = 0
"let g:go_fmt_options = '-tabs=false -tabwidth=4'
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_disable_autoinstall = 1
let g:go_play_open_browser = 0

au FileType go set noexpandtab
au FileType go set foldmethod=indent
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap K <Plug>(go-doc-vertical)
au FileType go nmap <Leader>g <Plug>(go-def)
