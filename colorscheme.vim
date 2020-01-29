"colorscheme nord
"colorscheme anderson
"colorscheme monochrome
colorscheme dracula
"colorscheme ayu 
"colorscheme simple-dark
"
" Hack to fix Type highlighting for c type structs and enums
" when opening multiple panels
augroup custom_highlighting
   autocmd!
   autocmd VimEnter,WinEnter * match Type /\w*_[t|e]\(\s\|)\)/
augroup END

