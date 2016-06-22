" File: MyConfig.vim
" Description: My Config
" Author: Feil <feilniu AT gmail DOT com>
" Last Change: 2016-06-18 23:39:58

" My plugins {{{
" TOhtml
let g:html_ignore_folding = 1
let g:html_use_css = 1
let g:use_xhtml = 1
" snipMate
let g:snips_author = 'Feil <feilniu AT gmail DOT com>'
" syntax sqlserver
let g:sql_type_default = 'sqlserver'
" }}}

" My Commands {{{
command! Etxt :e $VIM/vimfiles/syntax/txt.vim
command! EMyConfig :e $VIM/vimfiles/plugin/MyConfig.vim
command! EMyConfigAfter :e $VIM/vimfiles/after/plugin/MyConfigAfter.vim
nmap <Leader>yd /^\(134\\|135\\|136\\|137\\|138\\|139\\|147\\|150\\|151\\|152\\|157\\|158\\|159\\|178\\|182\\|183\\|184\\|187\\|188\)<CR>
" }}}

" Clear KFCIDs in Excel {{{
command ClearKFCID :call s:ClearKFCID()
nmap <unique> <Leader>ck :call <SID>ClearKFCID()<CR>
function s:ClearKFCID()
  %s/\D//ge
  g/^$/d
  sort nu
  %s/\d\+/UNION ALL SELECT \0/e
  1s/^UNION ALL SELECT /SELECT KFCID = /e
endfunction
" }}}

" Clear Phones {{{
command ClearPhone :call s:ClearPhone()
nmap <unique> <Leader>cp :call <SID>ClearPhone()<CR>
function s:ClearPhone()
  %s/\D//ge
  g/^$/d
  sort nu
  %s/\d\+/UNION ALL SELECT '\0'/e
  1s/^UNION ALL SELECT /SELECT Phone = /e
endfunction
" }}}

" Unescape URL {{{
command UnescapeURL :call s:UnescapeURL(0)
command UnescapeURLSplit :call s:UnescapeURL(1)
nmap <unique> <Leader>ue :call <SID>UnescapeURL(0)<CR>
nmap <unique> <Leader>uE :call <SID>UnescapeURL(1)<CR>
function s:UnescapeURL(IsSplitParams)
  if a:IsSplitParams == 1
    %s/[?&]/\r/ge
  endif
  %s/%\(\x\x\)/\=nr2char('0x'.submatch(1))/ge
  %s/%u\(\x\x\x\x\)/\=nr2char('0x'.submatch(1))/ge
endfunction
" }}}

" 全半角转换 {{{
command -range=% Full2Half :<line1>,<line2>s/[！-～]/\=nr2char(char2nr(submatch(0))-65248)/ge
command -range=% Half2Full :<line1>,<line2>s/[!-~]/\=nr2char(char2nr(submatch(0))+65248)/ge
" }}}

" Note {{{
command Kindle2DoubanNote :call s:Kindle2DoubanNote()
function s:Kindle2DoubanNote()
  %s#==========#</原文结束>\r<原文开始>#
  %s/- 您在位置 //
  %s/的标注 | 添加于.*$//
endfunction
" }}}

" vim:fdm=marker:
