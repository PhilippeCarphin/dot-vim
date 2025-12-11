nnoremap <buffer> <Leader>sb ggi#include <stdlib.h><CR>#include <stdio.h><CR><ESC>
nnoremap <buffer> <Leader>ssb ggi#include <stdlib.h><CR>#include <stdio.h><CR><CR>int main(int argc, char **argv){<CR><CR>if(argc < 2){<CR>fprintf(stderr, "%s: ERROR: Not enough arguments: %d\n", argv[0], argc);<CR>return 1;<CR>}<CR>return 0;<CR>}<CR><ESC>gg=G
nnoremap <buffer> <Leader>f o<ESC>iint TODO(){<CR>fprintf(stderr, "%s(): begin\n", __func__);<CR>return 0;<CR>}<ESC>?TODO<CR>cw
