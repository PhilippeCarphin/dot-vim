let g:markdown_fenced_languages = ['python', 'bash=sh', 'fortran', 'c', 'lisp', 'go', 'rust']

setlocal foldexpr=NestedMarkdownFolds()
nnoremap <S-Tab> zA
nnoremap <Tab> za

setlocal textwidth=80
