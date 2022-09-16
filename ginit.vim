Guifont Consolas:h14

let g:fullscreen=0
function! GuiWindowFullscreenToggle() abort
    if(g:fullscreen == 0)
        let g:fullscreen = 1
    else
        let g:fullscreen = 0
    endif

    call rpcnotify(0, 'Gui', 'WindowFullScreen', g:fullscreen)
endfunction

noremap <silent> <f11> :call GuiWindowFullscreenToggle()<CR>

