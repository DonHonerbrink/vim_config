"set nocompatible 
syntax on
set shortmess+=I
set tabstop=4
set shiftwidth=4
"set expandtab
set autoindent
set smartindent
set cindent
set termguicolors
set backspace=indent,eol,start
"set mouse=a
set laststatus=2
set autochdir
set nobackup
set noundofile
set scrolloff=10
"set number
set nonumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
filetype on
filetype indent on

" required for autocompletion
set nocp " non vi compatible mode
filetype plugin on " enable plugins
"
