call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

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
set autoindent
set smartindent
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

filetype on
filetype plugin indent on

" vim does not like c11 sometimes
let c_no_bracket_error = 1

"""""""""""""""""""""""""""""""""""
" global variables
"""""""""""""""""""""""""""""""""""
let g:explore_is_open = 0
let g:quickfix_is_open = 0
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

func! NextColors()
    let idx = index(g:colors, g:colors_name)
    return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
endfunc

func! PrevColors()
    let idx = index(g:colors, g:colors_name)
    return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
endfunc

function! RunScript(script) abort
    let l:build_script = findfile(a:script, ';')
    if !empty(l:build_script)
        execute 'AsyncRun' l:build_script
        copen
        let g:quickfix_is_open = 1
    else
        echo "build.sh not found"
    endif
endfunction


" highlighting and color
"""""""""""""""""""""""""""""""""""
"au Syntax c	source $VIMRUNTIME/syntax/c.vim

set cursorline
"hi Normal guibg=NONE ctermbg=NONE

syntax enable

set background=dark

"colorscheme bore
"colorscheme ghdark
"colorscheme simple-dark
"colorscheme challenger_deep
"colorscheme nord
"colorscheme nord-glass
"colorscheme quiet
"colorscheme sorbet
colorscheme embark
"colorscheme tender
"colorscheme bore
"colorscheme hybrid

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

" cycle through colorschemes
nnoremap <C-n> :exe "colo " .. NextColors()<CR>:colorscheme<CR>
nnoremap <C-p> :exe "colo " .. PrevColors()<CR>:colorscheme<CR>

" autocompletion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

if executable('clangd')
  augroup lsp_clangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd']},
          \ 'allowlist': ['c', 'cpp'],
          \ })
  augroup END
endif
augroup lsp_colors
  autocmd!
  autocmd ColorScheme * call s:ApplyLspHighlights()
augroup END

let g:lsp_semantic_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect
autocmd FileType c,cpp setlocal omnifunc=lsp#complete
set termguicolors


