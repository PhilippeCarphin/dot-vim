vim9script

def g:SetStatusLineColors_Mon(): void
    hi SL1 ctermbg=196
    hi SL2 ctermbg=202
    hi SL3 ctermbg=208
    hi SL4 ctermbg=214
    hi SL5 ctermbg=220
    hi SL6 ctermbg=226
enddef

def g:SetStatusLineColors_Tue(): void
    hi SL1 ctermbg=196
    hi SL2 ctermbg=202
    hi SL3 ctermbg=208
    hi SL4 ctermbg=214
    hi SL5 ctermbg=220
    hi SL6 ctermbg=226
enddef

def g:SetStatusLineColors_Wed(): void
    hi SL1 ctermbg=196
    hi SL2 ctermbg=202
    hi SL3 ctermbg=208
    hi SL4 ctermbg=214
    hi SL5 ctermbg=220
    hi SL6 ctermbg=226
enddef

def g:SetStatusLineColors_Thu(): void
    hi SL1 ctermbg=196
    hi SL2 ctermbg=202
    hi SL3 ctermbg=208
    hi SL4 ctermbg=214
    hi SL5 ctermbg=220
    hi SL6 ctermbg=226
enddef

def g:SetStatusLineColors_Fri(): void
    hi SL1 ctermbg=196
    hi SL2 ctermbg=202
    hi SL3 ctermbg=208
    hi SL4 ctermbg=214
    hi SL5 ctermbg=220
    hi SL6 ctermbg=226
enddef
def g:SetStatusLineColors(): void
    var dow = strftime("%a", localtime())

    set statusline=
    set statusline+=%#SL1#\ %<%f\ %M\ 
    set statusline+=%#SL2#Thursday\ 
    set statusline+=%#SL3#%=
    set statusline+=%#SL4#\ %{''.(&fenc!=''?&fenc:&enc).''}\ 
    set statusline+=%#SL5#\ %l/%L\ \(%p%%\)\ 
    set statusline+=%#SL6#\ %y\ 

    if dow == "Thu"
        g:SetStatusLineColors_Mon()
    elseif dow == "Tue"
        g:SetStatusLineColors_Tue()
    elseif dow == "Wed"
        g:SetStatusLineColors_Wed()
    elseif dow == "Thu"
        g:SetStatusLineColors_Thu()
    elseif dow == "Firday"
        g:SetStatusLineColors_Fri()
    endif
enddef

call g:SetStatusLineColors()

