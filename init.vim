"""""""""""""""""""""""""""""""""""
" plugins 
"""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'skywind3000/asyncrun.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""
" general config 
"""""""""""""""""""""""""""""""""""
set termguicolors
set cscopeverbose
set cscopetag
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
set nonumber
"set relativenumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
set wrap!
"set autochdir
set formatoptions-=cro " disable auto commenting
set nrformats+=alpha " with CTRL+A
set splitbelow

filetype on
filetype plugin indent on

" vim does not like c11 sometimes
let c_no_bracket_error = 1

"""""""""""""""""""""""""""""""""""
" global variables
"""""""""""""""""""""""""""""""""""
let g:explore_is_open = 0
let g:quickfix_is_open = 0
let g:asyncrun_pathfix = 1
let g:colors = getcompletion('', 'color')

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

function! RunScript(script) abort
    let l:cwd_script = getcwd() . '/' . a:script

    if filereadable(l:cwd_script)
        let l:cwd_script_abs = fnamemodify(l:cwd_script, ':p')
        let l:cwd_script_dir = fnamemodify(l:cwd_script_abs, ':h')
        execute 'AsyncRun -cwd=' . fnameescape(l:cwd_script_dir) . ' ' . fnameescape(l:cwd_script_abs)
        copen
        let g:quickfix_is_open = 1
        return
    endif

    let l:build_script = findfile(a:script, ';')

    if !empty(l:build_script)
        let l:build_script_abs = fnamemodify(l:build_script, ':p')
        let l:build_script_dir = fnamemodify(l:build_script_abs, ':h')
        execute 'AsyncRun -cwd=' . fnameescape(l:build_script_dir) . ' ' . fnameescape(l:build_script_abs)
        copen
        let g:quickfix_is_open = 1
    else
        echo a:script . " not found"
    endif
endfunction

syntax enable

"colorscheme None 
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

set tags=./.tags;/

"""""""""""""""""""""""""""""""""""
" keyboard remappings
"""""""""""""""""""""""""""""""""""
if has('win32')
    noremap <silent> <Leader>b :call RunScript('buildrun.bat')<CR>
    noremap <silent> <Leader>d :call RunScript('buildrun.bat')<CR>
    noremap <silent> <Leader>c :call RunScript('ctags.bat') "ctags completed"<CR>
    noremap <silent> <Leader>t :call RunScript('clang-format.bat') "clang-format completed"<CR>
else
    noremap <silent> <Leader>b :call RunScript('build.sh')<CR>
    noremap <silent> <Leader>d :call RunScript('buildrun.sh')<CR>
    noremap <silent> <Leader>c :call RunScript('ctags.sh') "ctags completed"<CR>
    noremap <silent> <Leader>t :call RunScript('clang-format.sh') "clang-format completed"<CR>
endif

noremap <silent> <Leader>v :so $MYVIMRC<CR>
noremap <silent> <Leader>1 :Buffers<CR>
noremap <silent> <Leader>2 :Files<CR>

" auto-indent entire file
noremap <silent> <leader>f gg=G<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>
noremap <silent> <Leader>q :call ToggleQuickfix()<CR>
noremap <silent> <Leader>, :cp<CR>
noremap <silent> <Leader>. :cn<CR>

" autocompletion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" Align entire file as CSV
vnoremap <leader>ca :>!column -t <CR>

set termguicolors


