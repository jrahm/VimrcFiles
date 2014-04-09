" This file contains mappings for my AltGr key.
" This allows for a wide variety of new and easy to
" reach key combinations.

" AltGr-J (Move the pane without moving the cursor)
map ï <c-e>
" page down
map Ï <c-d>

" This is alt-gr space
imap   <c-p>

" AltGr-K
map œ <c-y>
map Œ <c-U>

" AltGr-C Copy to the clipboard
map © "+y
" AltGr-V Paste from the clipboard
map ® "+p

" Some default quick access macros
map á @a
map ß @s
map ð @d

" Formatting text. AltGr-P 
map ë gqip

" These are for mapping tags so I can hop around easily 1-AltGr t
exe 'map þ :1tag <C-R><C-W><CR>'
for s:i in [1,2,3,4,5,6,7,8,9]
    exe 'map '.s:i.'þ :'.s:i.'tag <C-R><C-W><CR>'
endfor
