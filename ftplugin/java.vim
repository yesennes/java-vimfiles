comp javac
if !filereadable("Makefile") && !filereadable("makefile")
    set makeprg=javac\ -Xlint
else
    set makeprg=make
endif
set grepprg=java\ -jar\ ~/Documents/TA/checkstyle-6.2.2.jar\ -a
set grepformat=%f:%l:%c:\ %m,%f:%l:\ %m
nnoremap <F2> :!clear<Enter>:call <SID>Run()<Enter>
nnoremap <F4>:!clear<Enter>:!java %:r
nnoremap <F3> :grep %<CR>
nnoremap <F5> :make -cp .:/home/yesennes/Documents/cs1332/junit-4.12.jar %<CR>
nnoremap <F6> :!java -cp .:/home/yesennes/Documents/cs1332/junit-4.12.jar:/home/yesennes/Documents/cs1332/hamcrest-core-1.3.jar org.junit.runner.JUnitCore %:r<CR>
nnoremap <Leader>l /^.\{81}<CR>
nnoremap <CR> i"<CR>+ "<Esc>
nnoremap <Leader>g :call <SID>GenGetSet()<Enter>
nnoremap <Leader>d :call <SID>GenDocs()<Enter>
nnoremap <Leader>j :call <SID>OpenDocs()<Enter>
nnoremap <Leader>s :call <SID>CheckstyleDumb()<Enter>
nnoremap <Leader>i :call <SID>Import()<Enter>
iabbrev Sop System.out.print
iabbrev Sopl System.out.println
"iabbrev GBC GridBagConstraints
iabbrev psvm public<Space>static<Space>void<Space>main(String[]<Space>args)
iabbrev psfl private<Space>static<Space>final<Space>long<Space>serialVersionUID<Space>=

"ArrayList
function! s:Import()
    let l:reg = @@
    let l:search = @/
    normal! yiw
    tabe ~/.vim/library.txt
    tabm -1
    silent! execute "normal! /^".@@." \<CR>"
    if(line('.') == 1)
        execute "normal! Go\<ESC>pa \<ESC>pb"
    else
        normal! wyiW
        q
        execute "normal! ggoimport \<ESC>pa;\<C-O>\<C-O>"
    endif
endfunction
    
function! s:Run()
    execute "!java ".substitute(expand('%:r'), "/", ".", "g")
endfunction


function! s:CheckstyleDumb()
    let l:search = @/
    :%s/\(^.*\S\){/\1 {/gc
    :%s/)\([^ .,);]\)/) \1/gc
    :%s/if(/if (/gc
    :%s/for(/for (/gc
    :%s/while(/while (/gc
    :%s/}while/} while/gc
    :%s/}catch/} catch/gc
    :%s/catch(/catch (/gc
    :%s/}else/} else/gc
    let @/ = l:search 
endfunction

" import java.util.ArrayList;
"
"
"
"
"
"
" ArrayList;
" String;
function! s:OpenDocs()
    let l:reg = @@
    let l:search = @/
    normal! yiw
    let l:class = @@
    silent! execute "normal! gg/import [A-Za-z.]*".@@.";\<CR>"
    silent! normal! nyt;
    let @@ = @@[7:]
    let l:list = split(@@,'\.')
    if len(l:list) > 0 && l:list[-1] ==# l:class
        silent execute '!&google-chrome ///home/yesennes/Documents/docs/api/'.join(l:list,'/').'.html'
        execute "normal! \<C-O>\<C-O>"
    else
        silent execute '!&google-chrome ///home/yesennes/Documents/docs/api/java/lang/'.l:class.'.html'
    endif
    execute "normal! \<C-L>\<C-O>"
    let @/ = l:search
    let @@ = l:reg
endfunction

function! s:GenGetSet()
    let l:regt = @t
    let l:regn = @n
    let l:regw = @w
    let l:reg = @c
    let @w = ""
    normal! "nyiw~"cyiw~ge
    normal! "wya<
    echom @w
    normal! h
    normal! "tyiw
    execute "normal! GOpublic \<esc>\"tp\"wpa get\<esc>\"cpa() {\<cr>return \<esc>\"npa;\<cr>}\<cr>\<cr>public void set\<esc>\"cpa(\<esc>\"tp\"wpa \<esc>\"npa) {\<cr>this.\<esc>\"npa = \<esc>\"npa;\<cr>}\<esc>\<c-o>\<c-o>"
    let @t = l:regt
    let @n = l:regn
    let @w = l:regw
    let @@ = l:reg
endfunction

" public Test(boolean param) {
" public boolean test(boolean param) throws A, B {
" public boolean test(boolean param) {
function! s:GenDocs()
    let l:reg = @@
    normal! ^Y
    let l:ret = 0
    if match(@@, "void") == -1
        let l:ret = 1
    endif
    normal! f(yi(
    let l:params = split(@@, ", ")
    let l:names = []
    for p in l:params
        call add(l:names, split(p)[-1])
    endfor
    normal! f)llyiw
    if @@ ==# "throws"
        normal! wvf{gey
    else
        let @@ = ''
    endif
    let l:exec = split(@@, ", ")
    execute "normal! O/**\<CR> \<BS>\<CR>"
    for p in l:names
        execute "normal! a @param" p."\t\<CR>"
    endfor
    for e in l:exec
        execute "normal! a @throws" e."\t\<CR>"
    endfor
    if l:ret
        execute "normal! a @return\t\<CR>"
    endif
    normal! S*/
    let @@ =l:reg
endfunction
