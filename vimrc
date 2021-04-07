
set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=4       " Display width of \t character
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

filetype plugin indent on
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType go set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

set autoindent
set wrap
set textwidth=80
set wrapmargin=0
set colorcolumn=80

set scrolloff=5
set nolist " Show or don't show invisible chars like tabs and newlines
set hlsearch
set number
set showcmd " Display incomplete commands at the right
set backspace=indent,eol,start " Usual backspace behavior
set foldnestmax=1
set encoding=utf-8

syntax on
set t_Co=256 " Apparently this has to be set before setting the color scheme
set laststatus=2 " For vim-powerline
colorscheme molokai " Requires https://github.com/tomasr/molokai

inoremap jk <ESC>

nnoremap <Up> <C-y>k
nnoremap <Down> <C-e>j
nnoremap <Left> <ESC>:echoerr "Your mind is weak."<CR>
nnoremap <Right> <ESC>:echoerr "Your mind is weak."<CR>

inoremap <Up> <ESC>:echoerr "Join me or die"<CR>
inoremap <Down> <ESC>:echoerr "The clouded mind sees nothing"<CR>
inoremap <Left> <ESC>:echoerr "Your mind is weak."<CR>
inoremap <Right> <ESC>:echoerr "The clouded mind sees nothing"<CR>

:let g:org_todo_keywords=['TODO', 'GTD-IN', 'GTD-ACTION', 'GTD-PROJECT', 'GTD-NEXT-ACTION', 'GTD-WAITING', 'GTD-SOMEDAY-MAYBE', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'GTD-DONE', 'GTD-REFERENCE', 'GTD-DELEGATED']
