" let g:syntastic_quiet_messages = {'level': 'warnings'}
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1
" 
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" 
" let g:syntastic_mode_map = { 'mode': 'passive',
" 						   \ 'active_filetypes': ['python', 'javascript', 'go'],
" 						   \ 'passive_filetypes': ['scala', 'tex', 'java'] }
" 
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_post_args = "--ignore=E501,E226,E225,E227"
" let g:syntastic_go_checkers = ['go']
" let g:syntastic_c_compiler = 'clang'
" 
" map <leader>sc :SyntasticCheck<CR>



" - ALE ---------------------
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:alie_lint_on_insert_leave = 1

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'python': ['flake8'],
\   'go':     ['go build'],
\	'typescript': ['tslint'],
\	'vue': ['tslint'],
\	'html': ['htmllint'],
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_python_flake8_options = "--ignore=E501,F401,E226,E741,W191"


" ---------------------------
