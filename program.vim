set number
set relativenumber
set autowrite
set cindent
set complete=.,t,w,b,u,i
augroup makepre
    au!
    au QuickFixCmdPre make !ctags -R *
    au QuickFixCmdPre make !clear
augroup END
nmap <F1> :make %<Enter>
