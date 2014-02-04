call pathogen#infect()

function! StartUp()
" This is for using as man page viewer
if 0 == argc()
    NERDTree
endif
endfunction
