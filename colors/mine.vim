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
hi Normal       ctermfg=White ctermbg=16 guibg=black guifg=white
hi comment		ctermfg=DarkGray guifg=DarkGray
hi Type         ctermfg=46 guifg=Green
hi Conditional  ctermfg=yellow guifg=Yellow
hi Repeat       ctermfg=yellow guifg=yellow
hi Todo			ctermfg=Yellow guifg=Yellow ctermbg=Blue guibg=Blue
hi Folded       ctermfg=DarkCyan guifg=DarkCyan ctermbg=Black guibg=Black
hi LineNr		ctermfg=DarkCyan guifg=DarkCyan
hi operator		ctermfg=Cyan guifg=Cyan
hi String       ctermfg=Brown guifg=Brown
hi Special      ctermfg=40 guifg=DarkGreen
hi Preproc      ctermfg=White guifg=LightGray
hi Constant     ctermfg=199 guifg=Pink
hi Function     ctermfg=45 guifg=LightBlue
hi Identifier   ctermfg=45 guifg=LightBlue cterm=None
hi clear Visual
hi Visual		term=reverse cterm=reverse gui=reverse
hi DiffAdd      term=bold cterm=reverse ctermbg=None
hi DiffText     term=bold cterm=reverse ctermbg=None
