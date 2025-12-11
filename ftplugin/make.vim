setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

setlocal nolist
if version >= 900
    setlocal listchars=tab:\ \ ,lead:·,trail:·,precedes:←,extends:→
else
    setlocal listchars=tab:\ \ ,space:·,trail:·,precedes:←,extends:→
endif

nnoremap <buffer> <Leader>ssb ggicsrc = $(wildcard *.c)<CR>fsrc = $(wildcard *.f90)<CR>src = $(csrc) $(fsrc)<CR>obj = $(csrc:.c=.o) $(fsrc:.f90=.o)<CR><CR>all:test<CR><CR>main: $(obj)<CR>gcc $^ -o $@<CR><CR>test: main<CR>./$<<CR><CR>vars:<CR>@echo "src = [$(src)]"<CR>@echo "obj = [$(obj)]"<CR><ESC>
