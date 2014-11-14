"
" This file is where I define the options
"

let g:radiation_noisy = 1

" Pretty simple, I don't want to keep hitting
" tab
set autoindent

" I like the last status line
set laststatus=0
set foldmethod=syntax

" More bash-ish style tab-completion,
" far superior to the Windows-style
set wildmode=longest,list,full
set wildmenu

" I want Vim to continue my comments for
" me
set formatoptions+=or

" tabs are 4 spaces
set tabstop=4

" No word wrap please
set nowrap

" Split my windows to the right when
" I split horizontally
set splitright

" Set some better error marking messages
let g:errormarker_warninggroup="WarnMsg"
let g:errormarker_errorgroup="ErrorMsg"

" My syntastic c compiler opetions should
" have -Wall
let g:syntastic_c_compiler_options="-Wall -std=gnu99"
let g:syntastic_cpp_compiler_options="-Wall -std=gnu99"

" Let error marker differentiate between
" warnings and errors
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat
let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
let g:errormarker_warningtypes = "wW"

" Convert tabs to spaces
set expandtab
set shiftwidth=4
set smarttab

set guioptions=m
set guifont=Source\ Code\ Pro\ For\ Powerline\ Semi-bold\ 10
set autoread

filetype plugin on
let g:syntastic_java_javac_config_file_enabled=1
set omnifunc=syntaxcomplete#Complete
let g:syntastic_cpp_check_header = 1

set keymap=dvorak
" let g:radiation_c_cflags   = "$(cat .syntastic_c_config 2>/dev/null||true)"
" let g:radiation_cpp_cflags = "$(cat .syntastic_cpp_config 2>/dev/null||true)"

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

hi hsType     ctermfg=186 cterm=bold
hi VarId      ctermfg=188 cterm=none
let g:java_highlight_all=1

" Use box drawing characters
set fillchars=vert:│
set foldlevel=20
