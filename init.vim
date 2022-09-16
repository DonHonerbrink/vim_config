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
let g:quickfix_is_open = 0
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

function! ToggleQuickfix()
    if g:quickfix_is_open  
		let g:quickfix_is_open = 0
		:cclose
    else
		let g:quickfix_is_open = 1
		:copen
    endif
endfunction
" highlighting and color
"""""""""""""""""""""""""""""""""""
syntax on
au Syntax c	source $VIMRUNTIME/syntax/c.vim
au Syntax cpp source $VIMRUNTIME/syntax/c.vim

colorscheme ayu
"colorscheme atom-dark-256
"colorscheme embark
"colorscheme tender
"colorscheme lampaces-demon
"colorscheme apprentice
"colorscheme simple-dark

set cursorline
"hi Normal guibg=NONE ctermbg=NONE

set tags=./.tags;/

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
" preview tag/ close preview tags

" save file
"noremap <C-\> <C-w>}
"noremap <C-]> <C-w>z


if has('win32')
    noremap <silent> <Leader>b :echo system(findfile('build.bat', ';'))<CR>
    noremap <silent> <Leader>r :echo system(findfile('run.bat', ';'))<CR>
    noremap <silent> <Leader>c :echo system(findfile('ctags.bat', ';')) "ctags completed"<CR>
else
    noremap <silent> <Leader>b :echo system(findfile('build.sh', ';'))<CR>
    noremap <silent> <Leader>r :echo system(findfile('run.sh', ';'))<CR>
    noremap <silent> <Leader>c :echo system(findfile('ctags.sh', ';')) "ctags completed"<CR>
endif

" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>
noremap <silent> <Leader>q :call ToggleQuickfix()<CR>
noremap <silent> <Leader>, :cp<CR>
noremap <silent> <Leader>. :cn<CR>
 
"""""""""""""""""""""""""""""""""""
" notes
"""""""""""""""""""""""""""""""""""
" Ctrl-] go to tag
" Ctrl-o go back from tag

