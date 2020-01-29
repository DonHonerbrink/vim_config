set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic c/c++ settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_config_file = '/where_is_your/.syntastic_cpp_config'
let g:syntastic_quiet_messages = {"regex": ["pragma once"] }
let g:syntastic_c_compiler = 'g++'
let g:syntastic_c_check_header = 1
"let g:syntastic_c_config_file = '~/where_is_your/.syntastic_cpp_config'
let g:syntastic_quiet_messages = {"regex": ["pragma once"] }

