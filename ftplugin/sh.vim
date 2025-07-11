nnoremap <buffer> <Leader>ssb ggi#!/usr/bin/env -S bash -o errexit -o nounset -o errtrace -o pipefail -O inherit_errexit -O nullglob -O extglob<CR><BS><CR><ESC>
nnoremap <buffer> <Leader>sb ggi#!/usr/bin/env bash<CR><BS><CR><ESC>
nnoremap <buffer> <Leader>sso iset -o errexit<CR>set -o nounset<CR>set -o errtrace<CR>set -o pipefail<CR>shopt -s inherit_errexit<CR>shopt -s nullglob<CR>shopt -s extglob<CR><CR><ESC>
