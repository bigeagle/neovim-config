let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['go', 'python', 'javascript'],
                           \ 'passive_filetypes': ['scala', 'tex', 'java'] }

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = "--ignore=E501,E226,E225,E227"
let g:syntastic_c_compiler = 'clang'

map <leader>sc :SyntasticCheck<CR>
