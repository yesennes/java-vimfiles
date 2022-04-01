call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'leafOfTree/vim-vue-plugin', {
    \ 'branch': 'master',
    \ }
Plug 'fatih/vim-go'
call plug#end()
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
set wildmode=longest,list
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
"
set hidden

let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

let g:LanguageClient_serverCommands = {
    \ 'typescript': ['/nishome2/lmsense/.nvm/versions/node/v12.22.6/bin/typescript-language-server', '--stdio'],
    \ 'javascript': ['/nishome2/lmsense/.nvm/versions/node/v12.22.6/bin/typescript-language-server', '--stdio'],
    \ 'vue': ['/nishome2/lmsense/.nvm/versions/node/v12.22.6/bin/html-languageserver', '--stdio'],
    \ }
"    \ 'vue': ['/nishome2/lmsense/.nvm/versions/node/v12.22.6/bin/vls', '--stdio'],

let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = expand('~/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/LanguageServer.log')
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <Leader>* :call LanguageClient#textDocument_references()<CR>
