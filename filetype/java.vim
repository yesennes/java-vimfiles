comp javac
set makeprg=javac\ -Xlint
set grepprg=checkstyle
set grepformat=%f:%l:%c:%m,%f:%l:\ %m
nmap <F2> :!clear<Enter>:!java %:r<Enter>
nmap <F4>:!clear<Enter>:!java %:r
nmap <F3> :grep %<CR>
nnoremap <Leader>l /^.\{81}<CR>
nnoremap <CR> i"<CR>+ "<Esc>
nnoremap <Space> :call <SID>GenGetSet()<Enter>
nnoremap <Leader>d :call <SID>GenDocs()<Enter>
nnoremap <Leader>j :call <SID>OpenDocs()<Enter>
iabbrev Sop System.out.print
iabbrev Sopl System.out.println
iabbrev GBC GridBagConstraints
iabbrev psvm public<Space>static<Space>void<Space>main(String[]<Space>args)
iabbrev psfl private<Space>static<Space>final<Space>long<Space>serialVersionUID<Space>=

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
    execute "normal! gg/import [a-z.]*".@@."\<CR>"
    normal! nyt;
    let @@ = @@[7:]
    let l:list = split(@@,'\.')
    echom @@
    echom len(l:list)
    if len(l:list) > 0 && l:list[-1] ==# l:class
        execute '!google-chrome ///home/yesennes/Documents/docs/api/'.join(l:list,'/').'.html'
        execute "normal! \<CR>"
    else
        execute '!google-chrome ///home/yesennes/Documents/docs/api/java/lang/'.l:class.'.html'
        execute "normal! \<CR>"
    endif
    execute "normal! \<C-O>"
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
    execute "normal! GOpublic \<esc>\"tp\"wpa get\<esc>\"cpa() {\<cr>return \<esc>\"npa;\<cr>}\<cr>\<cr>pubic void set\<esc>\"cpa(\<esc>\"tp\"wpa \<esc>\"npa) {\<cr>this.\<esc>\"npa = \<esc>\"npa;\<cr>}\<esc>\<c-o>\<c-o>"
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
