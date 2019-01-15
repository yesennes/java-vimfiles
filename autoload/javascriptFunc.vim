function! javascriptFunc#swap()
    tabedit %
    execute "e" javascriptFunc#htmltojs()
endfunction

function! javascriptFunc#htmltojs()
    if(expand("%:e") ==# "html")
        return expand("%:r").".js"
    elseif (expand("%:e") ==# "js")
        return expand("%:r").".html"
    else
endfunction
