" let g:ycm_global_ycm_extra_conf = '~/.vim/config/ycm_extra_conf.py'
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_auto_trigger = 1
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
" let g:ycm_python_binary_path = '/home/bigeagle/bin/mdpython'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_whitelist = { 
    \ 'c': 1 ,
    \ 'cpp': 1,
    \}

au FileType cpp nnoremap <Leader>g :YcmCompleter GoTo<CR>


" set noshowmode
" set completefunc=LanguageClient#complete
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['mdl', 'pyls'],
"     \ }
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_loggingLevel = "DEBUG"
" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_settingsPath = '/home/bigeagle/.config/nvim/language-server.json'
" 
" 
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" let g:lsp_async_completion = 1
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" 
" au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['mdl', 'pyls']},
"         \ 'whitelist': ['python'],
"         \ 'config': {'pyls.plugins.pycodestyle.enabled': false},
"         \ })


set noshowmode
set shortmess+=c
set completeopt=noinsert,menuone,noselect

au TextChangedI * call ncm2#auto_trigger()
autocmd BufEnter * call ncm2#enable_for_buffer()

inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"let g:cm_completekeys = "\<Plug>(cm_completefunc)"
let g:echodoc#enable_at_startup = 1

let g:nvim_typescript#vue_support = 1
