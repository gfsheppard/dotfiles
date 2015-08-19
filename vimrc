set nocompatible   
filetype on
filetype plugin indent on
syntax on
set background=dark

" set autowrite
set ruler

set modelines=0
set history=500
set laststatus=2
set viminfo='1000,f1

" show line numbers, absolute and relative
" set number
" set relativenumber

" Change the leader key
" set mapleader=",";

" Switch between buffers without saving
set hidden

set autoindent
set shiftwidth=4
set tabstop=8
set smarttab

set hlsearch

autocmd BufNewFile,BufRead *.auto set filetype=php
autocmd BufNewFile,BufRead initialize.php nnoremap <buffer> 'n 'dI//jI//jI//jI//jI//'b

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

set ignorecase
set smartcase
set gdefault

set foldenable
set foldmethod=indent


" Key Maps
"
" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"
"map colon to spacebar
nmap <space> :
nmap * *``

" 
" bubble lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

vmap <c-up> xkp`[v]`
vmap <c-down> xp`[v]`

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-N><C-R> :set relativenumber<cr>
nmap <C-N><C-N> :set invnumber<cr>

" gnome disables the <c-]> search.
nmap <F12> <c-]>

" Capitalize last work
imap GG bgUiwea

" center a block when it is opened
nnoremap zo zozz

" split a buffer vertically
cmap vsb vertical sb


" Colorschemes
colorscheme xoria256
" colorscheme wombat
"

silent! call repeat#set("\<Plug>MyWonderfulMap",v:count)


" Macros 
let @i='oecho interpolate($query, $bind_array) ; die;0'
let @l='oecho list_template_variables($template);0'
let @m="oecho'<pre>'; print_r(get_defined_vars()); echo '</pre>';odie;0"
let @v="o$variables		= LoadIni::getVariables(GROUPNAME . '/display.ini', '*');0f*s"
let @j=''
let @k=''
let @l=''
