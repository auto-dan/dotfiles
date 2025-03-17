function! myspacevim#before() abort
    let g:spacevim_sidebar_width = 30
    # reverse grep under cursor
    nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
endfunction

function! myspacevim#after() abort
endfunction
