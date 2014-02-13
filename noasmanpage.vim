call pathogen#infect()

function! StartUp()
    " This is for using as man page viewer
    if !exists("g:as_man_page_viewer")
        if 0 == argc()
            NERDTree
        endif
    endif
endfunction
