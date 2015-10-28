" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Luke Senseney
" Last Change:	2015 Sep 16

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mine"
hi Normal       ctermfg=White ctermbg=16
hi comment		ctermfg=DarkGray
hi Type         ctermfg=46
hi Conditional  ctermfg=yellow
hi Repeat       ctermfg=yellow
hi Todo			ctermfg=Yellow ctermbg=Blue
hi Folded       ctermfg=DarkCyan ctermbg=Black
hi LineNr		ctermfg=DarkCyan
hi operator		ctermfg=Cyan
hi String       ctermfg=Brown
hi Special      ctermfg=40
hi Preproc      ctermfg=21
hi Constant     ctermfg=199
hi Function     ctermfg=45
hi Identifier   ctermfg=45 cterm=None
hi clear Visual
hi Visual		term=reverse cterm=reverse gui=reverse
