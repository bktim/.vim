set number " show line number
set ruler " show show the current row and column

"-----------------------------------------------------------
" Practical Vim tips
"-----------------------------------------------------------

" minimum config to activate vims built-in plugins (S. XXV)
set nocompatible
filetype plugin on

" Tip 81 S.204
" enable highlighting search matches
set hlsearch
" press ctrl+l to mute search highlighting temporarily 
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> 



"-----------------------------------------------------------
" YAML Config
"-----------------------------------------------------------
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

