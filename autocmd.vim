au BufNewFile *.h call AutoHFil()

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.h set filetype=c
" Use MySQL highlighting for sql files
au BufRead,BufNewFile *.sql set filetype=mysql
au BufRead,BufNewFile *.vert,*.frag,*.vp,*.fp,*.vs,*.fs set filetype=glsl
au BufRead,BufNewFile *.ocl set filetype=opencl
au BufRead,BufNewFile *.dart set filetype=dart
au BufRead,BufNewFile *.rkt set filetype=racket

" Because Mafiles are stupid :-(
au BufEnter *Makefile*,*.mk,makefile,MAKEFILE set noexpandtab
au BufEnter *.java nnoremap <buffer> í :call PutImportStatement()<CR>
au BufNewFile *.java call AutoJavaFile()
autocmd VimEnter * call StartUp()
