let g:qcc_query_command='abook --mutt-query'
let g:qcc_multiline=1
au BufRead /tmp/mutt* setlocal omnifunc=QueryCommandComplete tw=100 cc=100

