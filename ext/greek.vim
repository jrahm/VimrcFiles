" This contians key mappings for my greek keyboard layout.
" Since this is a completely different keyboard layout, this
" is not to be used to do micro management, but large scale
" macro editing

" These are mapping for when I have my keyboard in greek mode

" Basic movement keys
map η h
map ξ j
map κ k
map λ l

map Η H
map Λ L

" Page up and down
map Ξ Ï
map Κ Œ

" Insert mode for when i need to
" actually insert greek.
map ι i

" Predefined macros.
map α  @a 
map σ  @s
map δ  @d
map φ  @f

" Still have the ability to undo
map θ u

map Γ G
map γγ gg

" These are some code navigation
" mappings for when I am browsing
" code

" T = jump to the tag
exe 'map τ :1tag <C-R><C-W><CR>'
for s:i in [0,1,2,3,4,5,6,7,8,9]
    exe 'map '.s:i.'τ :'.s:i.'tag <C-R><C-W><CR>'
endfor
