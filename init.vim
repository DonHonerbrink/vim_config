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

function! BuildRun()
    :cexpr system(findfile('buildrun.sh', ';'))
    if len(filter(getqflist(), 'v:val.valid')) 
		let g:quickfix_is_open = 1
        :copen
    else
		let g:quickfix_is_open = 0
        :cclose
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

colorscheme afterglow

set cursorline

" enable for when using the None colorscheme
"hi Normal guibg=NONE ctermbg=NONE

set tags=./.tags;/

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
" preview tag/ close preview tags

" save file
"noremap <C-\> <C-w>}
"noremap <C-]> <C-w>z

" run a build script 
noremap <silent> <Leader>r :call BuildRun()<CR>

" rebuilds ctags
noremap <silent> <Leader>c :echo system(findfile('ctags.sh', ';')) "ctags completed"<CR>

" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" auto-indent
noremap <silent> <leader>f gg=G<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>

" show/hide quickfix window
noremap <silent> <Leader>q :call ToggleQuickfix()<CR>

" previous compile warning/error
noremap <silent> <Leader>, :cp<CR>

" next compile warning/error
noremap <silent> <Leader>. :cn<CR>

