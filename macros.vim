noremap <silent> <Leader>c :echo system(findfile('ctags.sh', ';'))<CR>:UpdateTypesFile<CR>
noremap <silent> <Leader>r :echo system(findfile('buildrun.sh', ';'))<CR>
noremap <silent> <Leader>b :TagbarToggle<CR>
noremap <silent> <Leader>v :so $MYVIMRC<CR>
noremap <Leader>. :CtrlPTag<CR>
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>t :bn<CR>
noremap <Leader>p :bp<CR>
"<C-x><C-o>shows autocomplete

