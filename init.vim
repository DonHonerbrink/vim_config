"""""""""""""""""""""""""""""""""""
" general config 
"""""""""""""""""""""""""""""""""""
set termguicolors
set cscopeverbose
set cscopetag
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
"set nonumber
set relativenumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
set wrap!
set autochdir
set formatoptions-=cro " disable auto commenting
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

colorscheme tender

set cursorline
"hi Normal guibg=NONE ctermbg=NONE

set tags=./.tags;/

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
if has('win32')
    noremap <silent> <Leader>b :echo system(findfile('build.bat', ';'))<CR>
    noremap <silent> <Leader>r :echo system(findfile('run.bat', ';'))<CR>
    noremap <silent> <Leader>c :echo system(findfile('ctags.bat', ';')) "ctags completed"<CR>
    noremap <silent> <Leader>t :echo system(findfile('clang-format.bat', ';')) "clang-format completed"<CR>
else
    noremap <silent> <Leader>b :echo system(findfile('build.sh', ';'))<CR>
    noremap <silent> <Leader>r :echo system(findfile('run.sh', ';'))<CR>
    noremap <silent> <Leader>c :echo system(findfile('ctags.sh', ';')) "ctags completed"<CR>
    noremap <silent> <Leader>t :echo system(findfile('clang-format.sh', ';')) "clang-format completed"<CR>
endif

noremap <silent> <Leader>v :so $MYVIMRC<CR>

" auto-indent entire file
noremap <silent> <leader>f gg=G<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>
noremap <silent> <Leader>q :call ToggleQuickfix()<CR>
noremap <silent> <Leader>, :cp<CR>
noremap <silent> <Leader>. :cn<CR>


