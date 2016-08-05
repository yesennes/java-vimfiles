set number
set autowrite
set makeprg=latex
set autochdir
nmap <F1> :make "%"<Enter>
augroup latexOpen
    au!
    au QuickFixCmdPost make !gnome-open "%:r.dvi"
augroup END
iabbrev -> \rightarrow
iabbrev bege \begin{enumerate}
iabbrev ende \end{enumerate}
iabbrev sec \section*
iabbrev dsz \mathbb{Z}
iabbrev dsr \mathbb{R}
