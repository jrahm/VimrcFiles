au BufNewFile *.h call AutoHFil()

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.h set filetype=d
" Use MySQL highlighting for sql files
au BufRead,BufNewFile *.sql set filetype=mysql
au BufRead,BufNewFile *.vert,*.frag,*.vp,*.fp,*.vs,*.fs set filetype=glsl

" Because Mafiles are stupid :-(
au BufEnter *Makefile*,*.mk,makefile,MAKEFILE set noexpandtab
autocmd VimEnter * call StartUp()
