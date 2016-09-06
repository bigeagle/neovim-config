if has('nvim')
    autocmd BufReadPost * Neomake
	autocmd BufWritePost * Neomake
	map <leader>sc :Neomake!<CR>
	let g:neomake_python_enabled_makers = ['flake8']
	let g:neomake_go_enabled_makers = ['go', 'golint']
	let g:neomake_cpp_enable_markers=['clang']
	let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
	let g:neomake_javascript_enabled_makers = ['eslint']

else
	let g:syntastic_quiet_messages = {'level': 'warnings'}
	let g:syntastic_check_on_open=1
	let g:syntastic_enable_signs=1

	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'

	let g:syntastic_mode_map = { 'mode': 'passive',
							   \ 'active_filetypes': ['python', 'javascript'],
							   \ 'passive_filetypes': ['scala', 'tex', 'java', 'go'] }

	let g:syntastic_python_checkers = ['flake8']
	let g:syntastic_python_flake8_post_args = "--ignore=E501,E226,E225,E227"
	let g:syntastic_c_compiler = 'clang'

	map <leader>sc :SyntasticCheck<CR>
endif
