:augroup javaCmds
:  au!
:  au FileType java so /home/yesennes/.vim/filetype/java.vim
:  au BufNewFile *.java execute "normal i/**\<CR>\<CR>@author Luke Senseney\<CR>@version 1.0" 
            \strftime("%b %d, %y")."\<CR>\<BS>*/\<CR>public class" expand("%:r") "{\r\r}\<Esc>2ggA"
:augroup END
:augroup programming
:  au!
:  au FileType java,c,python so $HOME/.vim/filetype/program.vim
:augroup END
