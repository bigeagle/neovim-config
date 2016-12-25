" let g:ycm_global_ycm_extra_conf = '~/.vim/config/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_auto_trigger = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_whitelist = { 
    \ 'c': 1 ,
    \ 'cpp': 1,
    \ 'python': 1
    \}
au FileType cpp nnoremap <Leader>g :YcmCompleter GoTo<CR>
