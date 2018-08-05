let g:dotvim=".vim"
augroup javaCmds
    au!
    au BufNewFile *.java execute "normal i/**\<CR>\<CR>@author Luke Senseney\<CR>@version 1.0" 
                \strftime("%b %d, %y")."\<CR>\<BS>*/\<CR>public class" expand("%:t:r") "{\r\r}\<Esc>2ggA"
augroup END

let g:dotvim=".vim"
augroup programming
    au!
    exe "au FileType java,c,cpp,python,javascript so $HOME/" . g:dotvim . "/program.vim" 
augroup END
"augroup programming
"    au!
"    exe "au FileType java,c,cpp,python so $HOME/" . g:dotvim . "/program.vim" 
"augroup END
"augroup general
"    au!
"    au FileType tex so $HOME/.vim/filetype/latex.vim
"augroup END
