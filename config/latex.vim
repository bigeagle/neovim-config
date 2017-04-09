" let g:LatexBox_latexmk_async = 2
" let g:LatexBox_latexmk_preview_continuously = 1
" let g:LatexBox_quickfix = 2
" let g:LatexBox_show_warnings = 1
" let g:LatexBox_autojump = 1
" let g:LatexBox_output_type = 'pdf'
" let g:LatexBox_viewer = 'qpdfview'
"

let g:tex_conceal=''
" let g:latex_viewer = 'qpdfview'
let g:latex_toc_width = 25
let g:latex_view_general_viewer = 'qpdfview'

function! TeXForwardSearch()
	if exists("g:latex_main_pdf")
		let cmd = "qpdfview --unique ".g:latex_main_pdf."#src:".expand('%:p').":".line('.').":".col('.')
	else
		let cmd = "qpdfview --unique ".expand('%:r').".pdf#src:".expand('%:p').":".line('.').":".col('.')
	endif
	echo cmd
	
	if has('nvim')
		let job = jobstart(cmd)
	elseif v:version >= 800
		let job = job_start(cmd)
	else
		let output = system(cmd)
	endif
endfunction

au filetype tex nnoremap <Leader>lt :call latex#toc#toggle()<CR>
au filetype tex nnoremap <Leader>f :call TeXForwardSearch()<CR>


