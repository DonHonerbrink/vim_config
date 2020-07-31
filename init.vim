"""""""""""""""""""""""""""""""""""
" general config 
"""""""""""""""""""""""""""""""""""
set termguicolors
set cscopetag
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
set nonumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
set wrap!
set autochdir
filetype on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""
" global variables
"""""""""""""""""""""""""""""""""""
let g:explore_is_open = 0
"""""""""""""""""""""""""""""""""""
" functions 
"""""""""""""""""""""""""""""""""""
function! ToggleExplore()
    if g:explore_is_open  
		let g:explore_is_open = 0
		:Rexplore
    else
		let g:explore_is_open = 1
		:Explore
    endif
endfunction

"""""""""""""""""""""""""""""""""""
" highlighting 
"""""""""""""""""""""""""""""""""""
syntax on
au Syntax c	source $VIMRUNTIME/syntax/c.vim
au Syntax cpp source $VIMRUNTIME/syntax/c.vim

colorscheme apprentice
set cursorline
hi Normal guibg=NONE ctermbg=NONE


"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
" preview tag/ close preview tags

nmap <silent> <Leader>w :w!<CR>
"noremap <C-\> <C-w>}
"noremap <C-]> <C-w>z
noremap <silent> <Leader>r :echo system(findfile('buildrun.sh', ';'))<CR>
noremap <silent> <Leader>v :so $MYVIMRC<CR>
noremap <silent> <Leader>c :echo system(findfile('cscope.sh', ';'))<CR>:UpdateTypesFile<CR>
noremap <silent> <Leader>e :call ToggleExplore()<CR>

"""""""""""""""""""""""""""""""""""
" notes
"""""""""""""""""""""""""""""""""""
" Ctrl-] go to key
" Ctrl=o go back from key

