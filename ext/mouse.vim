" This file is for mappings specific to the mouse.

for s:i in [0,1,2,3,4,5,6,7,8,9]
    exe 'map '.s:i.'<LeftMouse> <LeftMouse>:'.s:i.'tag <C-R><C-W><CR>'
endfor
