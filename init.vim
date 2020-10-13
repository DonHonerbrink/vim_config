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

function! BuildProject()
	" assync 
	let builddir = system(findfile('vimbuild.sh', '.;'))
	silent execute 'silent make -C ' . builddir
	redraw!
endfunction

function! BuildCScope()
	" assync 
	let cscope_res = system(findfile('cscope.sh', '.;'))
	let cscope_out = findfile('cscope.out', '.;')
	let cscope_pre = matchstr(cscope_out, ".*/")
	if !empty(cscope_out) && filereadable(cscope_out)
		exe "cs add " cscope_out cscope_pre
	endif

endfunction

augroup quickfix
"	autocmd!
"   	autocmd QuickFixCmdPost [^l]* cwindow
"   	autocmd QuickFixCmdPost   ^l* lwindow
augroup END

" highlighting and color
"""""""""""""""""""""""""""""""""""
syntax on
au Syntax c	source $VIMRUNTIME/syntax/c.vim
au Syntax cpp source $VIMRUNTIME/syntax/c.vim

"colorscheme apprentice
colorscheme ayu
set cursorline
hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
" preview tag/ close preview tags

" save file
nmap <silent> <Leader>w :w!<CR>:call BuildProject()<CR>
"noremap <C-\> <C-w>}
"noremap <C-]> <C-w>z

" run a build script
noremap <silent> <Leader>r :echo system(findfile('buildrun.sh', ';'))<CR>

" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" update c/c++ tags
noremap <silent> <Leader>c :call BuildCScope()<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>

"""""""""""""""""""""""""""""""""""
" notes
"""""""""""""""""""""""""""""""""""
" Ctrl-] go to tag
" Ctrl-o go back from tag

