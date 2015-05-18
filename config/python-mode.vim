" let g:pymode = 1
" let g:pymode_trim_whitespaces = 1
" let g:pymode_python = 'python'
" 
" let g:pymode_lint = 0
" let g:pymode_lint_write = 0
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'
" 
" let g:pymode_run = 1
" let g:pymode_run_key = '<leader>r'
" 
" 
" 
" " Load rope plugin
" let g:pymode_rope = 0
" 
" " Auto create and open ropeproject
" let g:pymode_rope_auto_project = 0
" 
" " Enable autoimport
" let g:pymode_rope_enable_autoimport = 0
" 
" " Auto generate global cache
" let g:pymode_rope_autoimport_generate = 1
" let g:pymode_rope_autoimport_underlineds = 0
" let g:pymode_rope_codeassist_maxfixes = 10
" let g:pymode_rope_sorted_completions = 1
" let g:pymode_rope_extended_complete = 1
" let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
" let g:pymode_rope_confirm_saving = 1
" let g:pymode_rope_global_prefix = "<C-x>p"
" let g:pymode_rope_local_prefix = "<C-x>r"
" let g:pymode_rope_vim_completion = 1
" let g:pymode_rope_guess_project = 1
" let g:pymode_rope_goto_def_newwin = ""
" let g:pymode_rope_always_show_complete_menu = 1
" 
" let g:pymode_folding = 1
" let g:pymode_motion = 1
" let g:pymode_virtualenv = 1
" 
" let g:pymode_options_indent = 1
" let g:pymode_options_other = 1
" 
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_print_as_function = 1


let python_highlight_all = 1
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python setlocal cc=80 

