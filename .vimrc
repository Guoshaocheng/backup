"-------------------------- COMMON SET--------------
set nocompatible
syntax on
set number
set relativenumber
set background=light

"prevent backup file (~)
set nobackup
set noundofile
set noswapfile
set incsearch  "highlight while searching with / or ?
set hlsearch   "Keep matches highlighted
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"------------------------Define Leader Key------------
let mapleader = "["

"------------------------Insert Mode------------------
inoremap jk <esc>
inoremap <esc> <nop>

"------------------------Normal Mode------------------
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

"---------------------------COMMAND MODE-------------
cnoremap <c-n> <DOWN>
cnoremap <c-p> <UP>
"cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

"------------------------Compile C and Java-----------
nnoremap <silent> <F5> :call AutoCompile()<cr>
func! AutoCompile()
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %:r"
    endif
endfunc

