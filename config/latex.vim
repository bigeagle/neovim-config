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
	let cmd = "qpdfview --unique ".expand('%:r').".pdf#src:".expand('%:p').":".line('.').":".col('.')
	echo cmd
	let output = system(cmd)
endfunction

au filetype tex nnoremap <Leader>lt :call latex#toc#toggle()<CR>
au filetype tex nnoremap <Leader>f :call TeXForwardSearch()<CR>


