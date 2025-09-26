let g:go_highlight_space_tab_error = 1

setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

setlocal nolist
if version >= 900
    setlocal listchars=tab:\ \ ,lead:·,trail:·,precedes:←,extends:→
else
    setlocal listchars=tab:\ \ ,space:·,trail:·,precedes:←,extends:→
endif
