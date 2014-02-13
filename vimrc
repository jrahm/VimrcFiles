" My Vimrc is now a file that simply calls a series of
" other files to complete my configuration.
source ~/.vim/vimrc.d/mappings.vim
source ~/.vim/vimrc.d/bash_start.vim
source ~/.vim/vimrc.d/options.vim
source ~/.vim/vimrc.d/autocmd.vim

" Load specific configuration for when I
" am either is some kind of xterm or not
if $TERM == "screen" || $TERM == "xterm" || $TERM =~ "256"
    source ~/.vim/vimrc.d/ifxterm.vim
else
    source ~/.vim/vimrc.d/ifnoxterm.vim
endif

" Load configuration for if I am
" loading vim as a man page viewer or
" not
if exists("g:as_man_page_viewer")
    source ~/.vim/vimrc.d/asmanpage.vim
else
    source ~/.vim/vimrc.d/noasmanpage.vim
endif

" Load a file in the current directory
" called .vimsource if it exists
if filereadable(".vimsource")
    source .vimsource
endif
