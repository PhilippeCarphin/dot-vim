" This file was generated from vimconfig.org by using org-babel-tangle.
" That file is 'tangled' to make this vimrc file which should be pointed to
" by a link '~/.vimrc -> $this_file'

set nocompatible              " be iMproved, required

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!  g'\"" | endif

autocmd BufReadPost COMMIT_EDITMSG,git-rebase-todo :0

set autoindent

filetype plugin indent on

set tabstop=4       " Display width of \t character
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

set listchars=tab:»~,extends:›,precedes:‹,nbsp:·,trail:·
set list

autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd BufRead *.out,*.log :AnsiEsc
autocmd BufRead *.out,*.log setlocal nowrap

set textwidth=0

" This doesn't work but I tried it with autocmd filetype and it seemed to
" work
" au BufRead,BufNewFile *.md setlocal textwidth=80
" au BufRead,BufNewFile *.org setlocal textwidth=80
" au BufRead,BufNewFile *.txt setlocal textwidth=80

set wrap
set wrapmargin=0

set colorcolumn=80

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set scrolloff=5

syntax on
set hlsearch
set number
set showcmd " Display incomplete commands at the right
set backspace=indent,eol,start " Usual backspace behavior
set encoding=utf-8

let mapleader = ' '

set t_Co=256 " Apparently this has to be set before setting the color scheme

colorscheme molokai " Requires https://github.com/tomasr/molokai
packadd powerline-plugin

autocmd FileType markdown setlocal foldexpr=NestedMarkdownFolds()

let g:org_todo_keywords=['TODO', 'GTD-IN', 'GTD-ACTION', 'GTD-PROJECT', 'GTD-NEXT-ACTION', 'GTD-WAITING', 'GTD-SOMEDAY-MAYBE', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'GTD-DONE', 'GTD-REFERENCE', 'GTD-DELEGATED']

let g:org_export_emacs="/usr/bin/emacs"

let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("k")': ['<C-p>'],
            \ 'PrtSelectMove("j")': ['<C-n>'],
            \ 'PrtHistory(-1)':     ['<down>'],
            \ 'PrtHistory(1)':      ['<up>'],
            \ 'AcceptSelection("t")': ['<CR>'],
            \ 'AcceptSelection("e")': [''],
            \ }

let g:ctrlp_map = '<C-f>'

set laststatus=2

inoremap jk <ESC>

let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

set timeoutlen=500 ttimeoutlen=50

nnoremap p pl
nnoremap P Pl

nnoremap <Up> <C-y>k
nnoremap <Down> <C-e>j

nnoremap <Left> <ESC>:echoerr "Your mind is weak."<CR>
nnoremap <Right> <ESC>:echoerr "Your mind is weak."<CR>

inoremap <Up> <C-O>:echoerr "Join me or die"<CR>
inoremap <Down> <C-O>:echoerr "The clouded mind sees nothing"<CR>
inoremap <Left> <C-O>:echoerr "Your mind is weak."<CR>
inoremap <Right> <C-O>:echoerr "The clouded mind sees nothing"<CR>

nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>

inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

nnoremap <C-a> ^
nnoremap <C-x> <Nop>

nnoremap <C-w>/ :vsplit<CR><C-w>l
nnoremap <C-w>- :split<CR><C-w>j
inoremap <C-w>/ <C-o>:vsplit<CR><C-o><C-w>l
inoremap <C-w>- <C-o>:split<CR><C-o><C-w>j

inoremap <C-w>h <C-o><C-w>h
inoremap <C-w>j <C-o><C-w>j
inoremap <C-w>k <C-o><C-w>k
inoremap <C-w>l <C-o><C-w>l

nnoremap é /
nnoremap É ?

nnoremap <silent> xx :echoerr 'Pressing "x" more than once consecutively is a sign of weakness'<CR>

" Funny thing to show '%' as '.' in Fortran files
" autocmd FileType fortran set conceallevel=2
" autocmd FileType fortran call matchadd('Conceal', '%', 10, -1, {'conceal': '.'})

" Technically version > 8.1.2269 but I only encounter either vim 8.0 or vim 9+
" so this is easier
if version >= 900
    " Silent makes it not complain if the package doesn't exits in
    " .vim/pack/*/opt/
    silent! packadd YouCompleteMe
    nnoremap gd :YcmCompleter GoToDefinition<CR>
endif

" Make sure to always check for a `.ycm_extra_conf.py` in new projects
let g:ycm_confirm_extra_conf = 0

runtime macros/justify.vim
" set formatoptions+=t

nnoremap <leader>c :noh<CR>
nnoremap <ESC><ESC> :noh<CR>
nnoremap <C-l> :noh<CR><C-l>

function! TabMode(nb)
    setlocal listchars=tab:\ \ ,lead:·,trail:·,precedes:←,extends:→
    let &tabstop=a:nb     " Display width of \t character
    let &shiftwidth=a:nb  " Indents will have a width of 4.
    let &softtabstop=a:nb " Sets the number of columns for a TAB.
    set noexpandtab       " Don't expand tabs to spaces
endfunction

function! SpaceMode(nb)
    setlocal listchars=tab:»~,extends:›,precedes:‹,nbsp:·,trail:·
    let &tabstop=a:nb       " Display width of \t character
    let &shiftwidth=a:nb    " Indents will have a width of 4.
    let &softtabstop=a:nb   " Sets the number of columns for a TAB.
    set expandtab           " Expand TABs to spaces.
endfunction

command Tabs :call TabMode(8)
command Spaces :call SpaceMode(4)

inoremap :w<CR> <ESC>:w<CR>
inoremap :wq<CR> <ESC>:wq<CR>
inoremap :wqa<CR> <ESC>:wqa<CR>

nnoremap <Leader>gf :tabe <cfile><CR>

let &t_SI = "\<Esc>]12;green\x7\<Esc>[6 q"
let &t_SR = "\<ESC>]12;red\x7"
let &t_EI = "\<Esc>]12;yellow\x7\<Esc>[2 q"
autocmd VimEnter * silent !echo -e "\033]12;blue\007"
autocmd VimLeave * silent !echo -ne "\033]112\007"

if version >= 900
    autocmd VimSuspend * silent !echo -ne "\033]112\007"
    autocmd VimResume * silent !echo -ne "\033]12;blue\007"
endif

function! MyOSCYankAndNormalYank(type, ...)
    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif
    call OSCYank(getreg("+"))
endfunction

nmap <silent> y :set opfunc=MyOSCYankAndNormalYank<CR>g@
nmap <silent> yy y_
vmap <silent> y :<C-U>call MyOSCYankAndNormalYank(visualmode(), 1)<CR>

function! ListAll()
    setlocal listchars=tab:»~,lead:·,trail:·,precedes:←,extends:→,space:·,eol:$,nbsp:=
endfunction
function! ListDefault()
    setlocal listchars=tab:»~,extends:›,precedes:‹,nbsp:·,trail:·
endfunction
command ListAll :call ListAll()
command ListDefault :call ListDefault()

nnoremap <buffer> <Leader>ssb ggi#!/usr/bin/env -S bash -o errexit -o nounset -o errtrace -o pipefail -O inherit_errexit -O nullglob -O extglob<CR><BS><CR><ESC>
nnoremap <buffer> <Leader>sb ggi#!/bin/bash<CR><BS><CR><ESC>
