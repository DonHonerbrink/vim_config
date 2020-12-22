"""""""""""""""""""""""""""""""""""
" general config 
"""""""""""""""""""""""""""""""""""
set termguicolors
set cscopeverbose
set cscopetag
set tabstop=4
set shiftwidth=4
"set softtabstop
set expandtab
"set softtabstop
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

" highlighting and color
"""""""""""""""""""""""""""""""""""
syntax on
au Syntax c	source $VIMRUNTIME/syntax/c.vim
au Syntax cpp source $VIMRUNTIME/syntax/c.vim

"colorscheme apprentice
colorscheme ayu
set cursorline
hi Normal guibg=NONE ctermbg=NONE

set tags=./.tags;/

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
" preview tag/ close preview tags

" save file
"noremap <C-\> <C-w>}
"noremap <C-]> <C-w>z

" run a build script
noremap <silent> <Leader>r :echo system(findfile('buildrun.sh', ';'))<CR>

noremap <silent> <Leader>c :echo system(findfile('ctags.sh', ';')) "ctags completed"<CR>
" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>

"""""""""""""""""""""""""""""""""""
" notes
"""""""""""""""""""""""""""""""""""
" Ctrl-] go to tag
" Ctrl-o go back from tag

