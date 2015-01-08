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
nmap <Leader>lt call latex#toc#toggle()

