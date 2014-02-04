" This is a function to allow me
" to know how many Vim instances
" I have stacked on each other.
function! StartBash()
    let temp=expand('%:t')

    let oldbuf=$VIMBUFFER
    if !exists("$VIMBUFFER") || $VIMBUFFER==""
        let $VIMBUFFER=temp
    else
        let $VIMBUFFER.=" ".temp
    endif

    exec "!bash --rcfile ~/.vimbashstart"
    let $VIMBUFFER=oldbuf
endfunction



" Run bash with Ctrl-B
map <C-b> :call StartBash()<CR>
