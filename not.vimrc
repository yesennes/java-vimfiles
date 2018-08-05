execute pathogen#infect()

set t_Co=256
set ruler
set shiftwidth=4
set backspace=2
set tabstop=4
set expandtab
set visualbell
set hlsearch
set incsearch
let g:netrw_sort_sequence="[\\/]$,\\<core\\%(\\.\\d\\+\\)\\=,\\.[a-np-z]$,\\.java$,\\.h$,\\.c$,\\.cpp$,*,\\.class$,\\.o$,\\.obj$, \\.info$,\\.swp$,\\.bak$,\\~$"
filetype plugin on
filetype indent on
colo mine
syntax enable
nnoremap <Leader>e :Texplore<CR>
nnoremap <Leader>c :cd %:h<CR>
nnoremap <Leader>t :tab split<CR><C-]>
set wildmenu
set wildmode=list:longest
"augroup shape
"    au!
"    au InsertEnter *
"                \ if v:insertmode == 'i' |
"                \   silent execute "!gnome-terminal-cursor-shape.sh ibeam" |
"                \ elseif v:insertmode == 'r' |
"                \   silent execute "!gnome-terminal-cursor-shape.sh underline" |
"                \ endif
"    au InsertLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
"    au VimLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
"augroup END
