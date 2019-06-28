set number " show line number
set ruler " show show the current row and column
set encoding=utf-8 " The encoding displayed
set fileencoding=utf-8 " The encoding written to the file.


"-----------------------------------------------------------
" Practical Vim tips
"-----------------------------------------------------------

" minimum config to activate vims built-in plugins (S. XXV)
set nocompatible
filetype plugin on

" Tip 81 p.204
" enable highlighting search matches
set hlsearch
" press esc+esc to mute search highlighting temporarily 
nnoremap <esc><esc> :<C-u>nohlsearch<CR><C-l> 

" wildmenu settings, Tip 32 p. 68
set wildmode=longest,list

" buffer list bindings, Tip 37 p. 85
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


"-----------------------------------------------------------
" YAML Config
"-----------------------------------------------------------
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"-----------------------------------------------------------
" Split settings from thoughtbot.com
"-----------------------------------------------------------

" remap cj, ck
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable more natural split, opening below and right
set splitbelow
set splitright


"-----------------------------------------------------------
" do filetype stuff, vimcasts whitespace and filetypes
"-----------------------------------------------------------

"Only do this part when compiled with support for autocommands
if has("autocmd")
	filetype on

	" dunno if this works for YAML but let's try
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	"
	
	" settings according to google style guide for web dev
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab	

	" settings according to PEP8 python standard, realpython.com
	autocmd FileType python
				\set tabstop=4 
				\set softtabstop=4
				\set shiftwidth=4
				\set textwidth=79
				\set expandtab
				\set autoindent
				\set fileformat=unix

	" run python code keybinding
	autocmd FileType python nnoremap <buffer> <F5> <Esc>:w<CR>:!clear;python3 %<CR>

endif
  
"-----------------------------------------------------------
" Easy expansion of the active file dir, Tip 42 p. 101
"-----------------------------------------------------------
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"-----------------------------------------------------------
" Color schemes, let's try again...
"-----------------------------------------------------------

