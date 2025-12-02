nnoremap <buffer> <Leader>ife ouse, intrinsic :: iso_fortran_env<ESC>==
nnoremap <buffer> <Leader>icb ouse, intrinsic :: iso_c_binding<ESC>==
nnoremap <buffer> <Leader>ino oimplicit none<ESC>==

let fortran_free_source=1

let fortran_more_precise=1

nnoremap <buffer> <Leader>ssb ggiprogram main<CR><CR>implicit none<CR><CR>call greet("World")<CR><CR>contains<CR>subroutine greet(name)<CR>character(len=*), intent(in) :: name<CR><CR>write(*,'("Hello ", a)') name<CR><CR><BS>end subroutine<CR><ESC>iend program<ESC>^i<BS><BS><ESC>
nnoremap <buffer> <Leader>ssm ggimodule my_mod<CR>implicit none<CR><CR>integer :: mod_var = 0<CR><CR>contains<CR><CR>subroutine greet(name) bind(C, name="greet")<CR>character(len=*), intent(in) :: name<CR>write(*,'("Hello ", a)') name<CR><BS>end subroutine<CR><CR><BS><BS>end module<ESC>
