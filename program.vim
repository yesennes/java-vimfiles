set number
set autowrite
set cindent
set complete=.,t,w,b,u,i
"augroup makepre
"    au!
"    if has('unix')
"        au QuickFixCmdPre make !ctags -R *
"        au QuickFixCmdPre make !clear
"    elseif has('win32')
"        au QuickFixCmdPre make exe shellescape("!%homepath%/Vim/ctags58/ctags.exe -R *", 1)
"        au QuickFixCmdPre make !cls
"    endif
"augroup END
nmap <F1> :make<Enter>
command! -nargs=1 -complete=tag Tabe tab tag <args>
