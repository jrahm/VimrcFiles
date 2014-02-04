let g:radiation_noisy = 1

" Pretty simple, I don't want to keep hitting
" tab
set autoindent

" I like the last status line
set laststatus=2

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
let errormarker_warninggroup="WarnMsg"
let errormarker_errorgroup="ErrorMsg"

" My syntastic c compiler opetions should
" have -Wall
let syntastic_c_compiler_options="-Wall -std=gnu99"
let syntastic_cpp_compiler_options="-Wall -std=gnu99"

" Let error marker differentiate between
" warnings and errors
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat
let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
let errormarker_warningtypes = "wW"

" Convert tabs to spaces
set expandtab
set shiftwidth=4
set smarttab

set guioptions=m
set guifont=Source\ Code\ Pro\ For\ Powerline\ Semi-bold\ 10
set autoread

filetype plugin on
let syntastic_java_javac_config_file_enabled=1
set omnifunc=syntaxcomplete#Complete
let g:syntastic_cpp_check_header = 1

set keymap=dvorak
let g:radiation_c_cflags   = "$(cat .syntastic_c_config||echo)"
let g:radiation_cpp_cflags = "$(cat .syntastic_cpp_config||echo)"

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
