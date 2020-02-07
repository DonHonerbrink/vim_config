"colorscheme nord
"colorscheme anderson
"colorscheme monochrome
"colorscheme dracula
colorscheme ayu
"colorscheme simple-dark
"
" Hack to fix Type highlighting for c type structs and enums
" when opening multiple panels
augroup custom_highlighting
   autocmd!
   "autocmd VimEnter,WinEnter * match Type /\w*_[t|e]\(\s\|)\)/
   autocmd VimEnter,WinEnter * call PjHighlighting()
   autocmd ColorScheme * call PjHighlighting()
augroup END

function! PjHighlighting()
syn match Type /pj_\w*\(\s\|)\)/ 
syn match Type /ss_\w*\(\s\|)\)/ 
syn match Type /\w*_t\(\s\|)\)/ 
syn match Constant /GL_\w*/
syn match Constant /PJ_\w*/
syn match Constant /SS_\w*/
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function

endfunction





