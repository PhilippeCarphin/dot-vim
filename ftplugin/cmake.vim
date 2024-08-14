nnoremap <buffer> <Leader>sb ggicmake_minimum_required(VERSION 3.20)<CR><CR>project(X C Fortran)<CR><CR><ESC>
nnoremap <buffer> <Leader>ch oinclude(CTest)<CR>add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND})<CR><CR><ESC>
