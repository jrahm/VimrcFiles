" Pretty simple, I don't want to keep hitting
" tab
syn on

function! PreservingKeymap( exe )
    let tmpmap=&keymap
    set keymap=
    exec a:exe
    exec 'set keymap='.tmpmap
endfunction

" run make followed by bash
" when I hit <F5>
map <F5> :make<CR><CR>:call StartBash()<CR>

" F8 may be pressed to change the layout between
" DVORAK and QWERTY
imap <F8> <ESC>:call SwapKeys()<CR>a

" Vim-style keys for
" navigating tabs
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

" Vim-style keys for
" navigating panes. <C-W> is
" too much work

nmap <S-h> <C-w><Left>
nmap <S-l> <C-w><Right>
nmap <S-k> <C-w><UP>
nmap <S-j> <C-w><Down>

" since I remapped S-k, now C-k is the
" man page keystroke
noremap <C-K> :Man <c-r>=expand("<cword>")<cr><CR>
for s:i in [1,2,3,4,5,6,7,8,9]
    exe 'noremap '.s:i.'<C-K> :Man '.s:i.' <c-r>=expand("<cword>")<cr><CR>'
endfor

" Control space attempts to finish
" my word. C-P is too hard to hit
"
map! <C-@> <C-p>

" Vim style navigation in the menus
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

" F1,F2 Go to the next and previous make error
map <F2> :cn<CR>  
map <F1> :cp<CR>  

" tab will append a tab at the beginning
" move the cursor to teh soft start of line
map <Tab> I<Tab><ESC>$^
" shift-tab dedents either 4 spaces, or
" one white space character.
map <S-Tab> :.s/^\(    \\|\s\)//g<CR>:noh<CR>

"toggle numbers
map <C-n><C-n> :set nu!<CR>
map <C-n><C-r> :set relativenumber!<CR>
map <C-n><C-m> <Leader>mt


" Set up some stuff for ctags
let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 50
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" set semi colon to just append a semi
" colon at the end of the line
map ; :.s/$/;/<CR>

" Remap arrow keys to move more rapidly
map <UP>    5k
map <DOWN>  5j
map <RIGHT> 5l
map <LEFT>  5h

" Since I re mapped indent,
" the gt and lt keys colors are for
" resizing vertical splits
map > :vert res +5<CR>
map < :vert res -5<CR>

" map +/- to remap horizontal splits
map + :res +5<CR>
map - :res -5<CR>


" Commands run with <S-C> this is
" my 'external command interface'

" run make
map <S-C>m :make<CR>

" More intuitive clipboard paste
map <S-C>v "+gp

map <S-C>e :Errors<CR>

" cycle make errors
map <S-C>n :cn<CR>
map <S-C>p :cp<CR>

" Grep for a word
map <S-C>gW "1yiw:exe "grep -ri '".@1."' *"<CR>

" Run a variable called runprg in bash
map <S-C>r :exe "!".substitute(runprg,'%',expand('%:t'),'')<CR>

" Run tree
map <S-C>t :!tree<CR>
" Run the last commands
map <S-C>c :<UP><CR>
" This is faster than hitting the @ sign
" used for running macros

map <S-C>j @
noremap q :call SwapKeys()<CR>q

" Highlight a section and run this to replace
" all occurences
vnoremap <S-C>s "zy:%s/<C-r>z//g<left><left>

" Commands used for general ease of access

" New horizontal-split
map <S-N>hs :split<CR>
" New vertical-split
map <S-N>v :vsplit<CR>
" New tab
map <S-N>t :tabe<CR>
" Write
map <S-N>w :w<CR>
" Write and save the session
map <S-N>ww :w<CR>:mksession! ~/.vimses_default<CR>:syn on<CR>
" Ask to edit file
map <S-N>e :e 
" Edit file with the directory already filled
" out as the directoy of current directory
map <S-N>E :e <C-r>=expand('%:p:h')<CR>/
" Source the open file
map <S-N>so :so %:p<CR>
" Edit an scp'd file
map <S-N>scp :e scp://<UP>
" run a command and replace the file with
" its outputs
map <S-N>c :%! 

" Open a vertically splitted scratch
" pad
map <S-N>ss :40 vsplit /dev/null<CR>

" Toggle the crappy vim-style hex mode
map <S-N>x :call ToggleHexMode()<CR>

map <S-F>c :foldclose<CR>
map <S-F>o :foldopen<CR>

vmap <S-F>c zf

" This one does a push to industrial for someone else to pull down
vmap <F1> :w !ssh industrial 'cat > /tmp/tmp && chmod 777 /tmp/tmp'<CR><CR>
" This one does a pull from industrial
vmap <F2> :!ssh industrial 'cat /tmp/tmp'<CR>

vmap <Tab> :g/^/norm I<TAB><CR>:noh<CR>gv
vmap <S-Tab> :s/^\(    \\|\s\)//g<CR>:noh<CR>gv

" In visual mode, we can't change 
" the pane, so remap these to faster
" highlight speeds
vmap <S-J> 5j
vmap <S-K> 5k
vmap <S-L> 5l
vmap <S-H> 5h

" Print the number of words in the current
" selection. This is good for writing essays
" in LaTeX
vmap <S-W>c :w !wc -w<CR>
map <S-W>c :w !wc -w<CR>

" Write-push. Save a file to Industrial
map <S-N>wp :call WritePush("industrial")<CR>
map zp yyp:.s/begin/end/<CR>
map z' 0i\{}<ESC>hi

" Write as superuser! The most useful function ever!
" No longer need to have that aw crap moment when ypu
" realize you're editing as a normal user
map <S-N>wsu :w! /tmp/vimtmp<CR>:!sh -c 'sudo cp /tmp/vimtmp %:p'<CR>L

" mapping for easy use with errormarker.vim
map <leader><leader>c :ErrorAtCursor<CR>

source ~/.vim/vimrc.d/ext/altgr.vim
source ~/.vim/vimrc.d/ext/greek.vim
