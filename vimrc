" This file was generated from vimconfig.org by using org-babel-tangle.
" That file is 'tangled' to make this vimrc file which should be pointed to
" by a link '~/.vimrc -> $this_file'

set nocompatible              " be iMproved, required
filetype plugin indent on

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!  g'\"" | endif

autocmd BufReadPost COMMIT_EDITMSG,git-rebase-todo :0

set autoindent
set list

set tabstop=4       " Display width of \t character
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

set listchars=tab:»~,extends:›,precedes:‹,nbsp:·,trail:·

autocmd FileType make,go setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

if version >= 900
    autocmd FileType make,go setlocal listchars=tab:\ \ ,lead:·,trail:·,precedes:←,extends:→
else
    autocmd FileType make,go setlocal listchars=tab:\ \ ,space:·,trail:·,precedes:←,extends:→
endif

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

syntax on
set scrolloff=5
set hlsearch
set number
set showcmd " Display incomplete commands at the right
set backspace=indent,eol,start " Usual backspace behavior
set encoding=utf-8

set t_Co=256 " Apparently this has to be set before setting the color scheme
colorscheme molokai " Requires https://github.com/tomasr/molokai

autocmd FileType markdown setlocal foldexpr=NestedMarkdownFolds()

let g:org_todo_keywords=['TODO', 'GTD-IN', 'GTD-ACTION', 'GTD-PROJECT', 'GTD-NEXT-ACTION', 'GTD-WAITING', 'GTD-SOMEDAY-MAYBE', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'GTD-DONE', 'GTD-REFERENCE', 'GTD-DELEGATED']

let g:org_export_emacs="~/.local/bin/emacs"

set laststatus=2

inoremap jk <ESC>

let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" set noesckeys

set timeoutlen=500 ttimeoutlen=50
nnoremap <Up> <C-y>k
nnoremap <Down> <C-e>j

nnoremap <Left> <ESC>:echoerr "Your mind is weak."<CR>
nnoremap <Right> <ESC>:echoerr "Your mind is weak."<CR>

inoremap <Up> <ESC>:echoerr "Join me or die"<CR>
inoremap <Down> <ESC>:echoerr "The clouded mind sees nothing"<CR>
inoremap <Left> <ESC>:echoerr "Your mind is weak."<CR>
inoremap <Right> <ESC>:echoerr "The clouded mind sees nothing"<CR>

if $SSH_CLIENT == ""
    set clipboard=unnamed
endif

" Funny thing to show '%' as '.' in Fortran files
" autocmd FileType fortran set conceallevel=2
" autocmd FileType fortran call matchadd('Conceal', '%', 10, -1, {'conceal': '.'})

" Technically version > 8.1.2269 but I only encounter either vim 8.0 or vim 9+
" so this is easier
if version >= 900
    " Silent makes it not complain if the package doesn't exits in
    " .vim/pack/*/opt/
    silent! packadd YouCompleteMe
endif

runtime macros/justify.vim
" set formatoptions+=t
