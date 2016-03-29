" Description: SQL after ftplugin for folding
" Author: Feil <feilniu AT gmail DOT com>
" Last Change: 2016-03-10 17:08:15

function! SQLFoldLevel(lineno)
  if a:lineno == 1
    return 0
  endif
  if getline(a:lineno) == '$$'
    return 's1'
  endif
  if getline(a:lineno-1) == '$$'
    return 'a1'
  endif
  return '='
endfunction

setl foldexpr=SQLFoldLevel(v:lnum)
setl foldmethod=expr
"setl foldminlines=2
