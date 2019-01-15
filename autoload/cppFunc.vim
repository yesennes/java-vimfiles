function! cppFunc#swap()
    tabedit %
    execute "e" cppFunc#ctoh()
endfunction

function! cppFunc#ctoh()
    if(expand("%:e") ==# "h")
        return expand("%:r").".c"
    elseif (expand("%:e") ==# "hpp")
        return expand("%:r").".cpp"
    elseif (expand("%:e") ==# "c")
        return expand("%:r").".h"
    else
        return expand("%:r").".hpp"
    endif
endfunction
