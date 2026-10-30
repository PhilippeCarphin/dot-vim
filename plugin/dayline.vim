vim9script

def g:SetStatusLineColors_Mon(): void
    hi SL1 ctermbg=28 ctermfg=7
    hi SL2 ctermbg=29 ctermfg=7
    hi SL3 ctermbg=30 ctermfg=7
    hi SL4 ctermbg=31 ctermfg=7
    hi SL5 ctermbg=32 ctermfg=7
    hi SL6 ctermbg=33 ctermfg=7
enddef

def g:SetStatusLineColors_Tue(): void
    hi SL1 ctermbg=34 ctermfg=0
    hi SL2 ctermbg=70 ctermfg=0
    hi SL3 ctermbg=106 ctermfg=0
    hi SL4 ctermbg=142 ctermfg=0
    hi SL5 ctermbg=178 ctermfg=0
    hi SL6 ctermbg=214 ctermfg=0
enddef

def g:SetStatusLineColors_Wed(): void
    hi SL1 ctermbg=49 ctermfg=0
    hi SL2 ctermbg=43 ctermfg=0
    hi SL3 ctermbg=37 ctermfg=7
    hi SL4 ctermbg=31 ctermfg=7
    hi SL5 ctermbg=25 ctermfg=7
    hi SL6 ctermbg=19 ctermfg=7
enddef

def g:SetStatusLineColors_Thu(): void
    hi SL1 ctermbg=21 ctermfg=7
    hi SL2 ctermbg=27 ctermfg=7
    hi SL3 ctermbg=33 ctermfg=7
    hi SL4 ctermbg=39 ctermfg=0
    hi SL5 ctermbg=45 ctermfg=0
    hi SL6 ctermbg=51 ctermfg=0
enddef

def g:SetStatusLineColors_Fri(): void
    hi SL1 ctermbg=196 ctermfg=0
    hi SL2 ctermbg=202 ctermfg=0
    hi SL3 ctermbg=208 ctermfg=0
    hi SL4 ctermbg=214 ctermfg=0
    hi SL5 ctermbg=220 ctermfg=0
    hi SL6 ctermbg=226 ctermfg=0
enddef

def g:Dow(): string
    return strftime("%A", localtime())
enddef
def g:DiffStatCmd(echo: bool = 0): string
    var cmd = "git -C $(dirname " .. expand('%') .. ") diff --numstat -- " .. expand('%')
    if echo
        echo "cmd = " .. cmd
    endif
    return system(cmd)
enddef
def g:DiffStat(): string
    var fugitivePart = g:FugitiveStatusline()
    if fugitivePart == ""
        return ""
    endif

    var result = g:DiffStatCmd(0)
    # echo "result = " .. result
    var words = split(result)
    if len(words) == 0
        return fugitivePart .. "(=)"
    else
        return fugitivePart .. "(+" .. words[0] .. ",-" .. words[1] .. ")"
    endif
enddef

def g:SetStatusLineColors(dow: string): void

    set statusline=
    set statusline+=%#SL1#\ %<%f\ %M\ 
    set statusline+=%#SL2#\ %{Dow()}\ 
    set statusline+=%#SL3#%=%{g:DiffStat()}%=
    set statusline+=%#SL4#\ %{''.(&fenc!=''?&fenc:&enc).''}\ 
    set statusline+=%#SL5#\ %l/%L\ \(%p%%\)\ 
    set statusline+=%#SL6#\ %y\ 

    if dow == "Mon"
        g:SetStatusLineColors_Mon()
    elseif dow == "Tue"
        g:SetStatusLineColors_Tue()
    elseif dow == "Wed"
        g:SetStatusLineColors_Wed()
    elseif dow == "Thu"
        g:SetStatusLineColors_Thu()
    elseif dow == "Fri"
        g:SetStatusLineColors_Fri()
    endif
enddef

call g:SetStatusLineColors(strftime("%a", localtime()))

