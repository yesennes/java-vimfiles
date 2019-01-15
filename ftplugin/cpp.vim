nnoremap <Leader>s :call cppFunc#swap()<Enter>
nnoremap <Leader>b set makeprg=make\ -C\ build

function! GetDec()
    let l:func = matchlist(getline('.'), '\s*\(friend\)\?\s*\(.*\s\)\(\S*(.*).*\);')
    let l:isFriend = strlen(l:func[1]) != 0
    let l:ret = l:func[2]
    let l:nameArgs = l:func[3]
    let l:line = line('.')
    let l:namespace = ""
    normal! [{
    while(l:line != line('.'))
        let l:section = matchlist(getline('.'), '\s*\(\w\+\)\s*\(\w\+\)')
        if(l:section[1] ==# "namespace")
            let l:namespace = l:section[2]
        elseif(!l:isFriend)
            let l:nameArgs = l:section[2]."::".l:nameArgs
        endif
        let l:line = line('.')
        normal [{
    endwhile
    return [l:namespace, l:ret.l:nameArgs]
endfunction


function! GenCpp()
    let l:headers = []
    g/.*(.*).*;/let l:headers = l:headers + [GetDec()]
    echo l:headers[0][1]
    let @@ = 'namespace '.headers[0][0].'{'
    for header in l:headers
        let @@ = @@."\n".header[1]."{\n}\n"
    endfor
    let @@ = @@."}"
endfunction
