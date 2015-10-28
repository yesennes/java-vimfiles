set number
set autowrite
set cindent
augroup makepre
    au!
    au QuickFixCmdPre make !ctags *
    au QuickFixCmdPre make !clear
augroup END
nmap <F1> :make %<Enter>
