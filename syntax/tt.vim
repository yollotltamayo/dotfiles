" Vim syntax file
" Language: Text to Tex 
" Maintainer: Yollotl Tamayo
" Latest Revision: 6 December 2020

if exists("b:current_syntax")
  finish
endif

syn keyword BasicKeyword ## ##* _ # #*
syn match intNum '[-+]\d\+'

let b:current_syntax = "cel"

hi def link BasicKeyword Statement
hi def link intNum Constant

