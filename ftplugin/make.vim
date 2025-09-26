setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

setlocal nolist
if version >= 900
    setlocal listchars=tab:\ \ ,lead:·,trail:·,precedes:←,extends:→
else
    setlocal listchars=tab:\ \ ,space:·,trail:·,precedes:←,extends:→
endif
