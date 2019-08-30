set number " show line number
set ruler " show show the current row and column
set encoding=utf-8 " The encoding displayed
set fileencoding=utf-8 " The encoding written to the file.
syntax enable

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
filetype indent on

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

	" settings according to google style guide for web dev
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab	

	" settings according to PEP8 python standard, realpython.com
	autocmd FileType python
				\setlocal tabstop=4 
				\setlocal softtabstop=4
				\setlocal shiftwidth=4
				\setlocal textwidth=79
				\setlocal expandtab
				\setlocal autoindent
				\setlocal fileformat=unix
				\setlocal formatoptions+=t

	highlight BadWhitespace ctermbg=red guibg=red

	nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
	au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

	" run python code keybinding
	autocmd FileType python nnoremap <buffer> <F5> <Esc>:w<CR>:!clear;python3 %<CR>

endif

"-----------------------------------------------------------
" Easy expansion of the active file dir, Tip 42 p. 101
"-----------------------------------------------------------
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


"-----------------------------------------------------------
" Search settings
"-----------------------------------------------------------

" Enable incsearch, Tip 51 p.125
set incsearch

" Enable smart search
set smartcase

" Enable matching tags 
runtime macros/matchit.vim


"-----------------------------------------------------------
" Substitution settings
"-----------------------------------------------------------

" Fixing the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"-----------------------------------------------------------
" Emmet-vim settings
"-----------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"-----------------------------------------------------------
" Vim Templates - shapeshed.com/vim-templates/
"-----------------------------------------------------------
if has("autocmd")
	augroup templates
		autocmd BufnewFile *.py 0r ~/.vim/templates/skeleton.py
	augroup END
endif

" display status line, using lightline vim plugin
set laststatus=2


" enagle redo with U, as undo is u
nnoremap U <C-R>

"-----------------------------------------------------------
" Color schemes, let's try again...
"-----------------------------------------------------------
set background=dark
colorscheme solarized



"-----------------------------------------------------------
" Leader Key custom mappings
"-----------------------------------------------------------


" this changes winheight when using term!
set winheight=38

" testing leader key
map <SPACE> <leader>

nmap <leader>+ 10<C-W>+<CR>
nmap <leader>- 10<C-W>-<CR>

nnoremap <leader>q :wqa!<CR>
nnoremap <leader>w :wa<CR>
tnoremap <F1> <C-W>:q!<CR>

"-----------------------------------------------------------
" Netrw toggle stuff
"-----------------------------------------------------------
let g:netrw_banner=0
let g:NetrwIsOpen=0

" https://vi.stackexchange.com/questions/10988/toggle-explorer-window
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

noremap <leader>e :call ToggleNetrw()<CR>


set backspace=indent,eol,start
