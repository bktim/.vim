"basic setup,line number and syntax
set number
syntax on

"filetype support
filetype indent on

"show existing tab with 4 spaces width
set tabstop=4

"when indenting use 4 spaces width
set shiftwidth=4

"on pressing tab, insert 4 spaces
set expandtab


" enable color scheme

" finding files 
" search down into subfolders
" Prodvides tab-completeion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" This enables:
" - Hit tab to :find by a partial match
" - Use * to enable wildcard search (fuzzy)

" - :b lets you autocomplete any open buffer

