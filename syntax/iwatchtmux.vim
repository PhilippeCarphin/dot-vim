
syn include @sh syntax/sh.vim

" Order is important here: Error has to be last so it matches anything that
" doesn't match the other ones.
syn match IwatchTmuxError ".*"

" Line starting with >> and %% to set target pane and typing speed
syn match IwatchTmuxSetTargetLine "^>> [0-9]\+$"
syn match IwatchTmuxSetTypingSpeedLine "^%% [0-9]\+\(\.[0-9]\+\)\?$"

" Lines starting with #
syn match IwatchTmuxComment "^#.*$"

" Lines starting with !
syn region IwatchTmuxShellLine matchgroup=IwatchTmuxShellStart start="^!!" end="$" contains=@sh

" Lines starting with @ and a number
syn match IwatchTMuxSendKeysStart "^@[0-9]\+" nextgroup=IwatchTmuxSendKeysKeys
syn match IwatchTMuxSendKeysStart "^@@" nextgroup=IwatchTmuxSendKeysKeys
syn match IwatchTmuxSendKeysKeys ".*" contained contains=IwatchTmuxNamedKeys
syn keyword IwatchTmuxNamedKeys Space Enter Tab contained


" Lines starting with & and a number
syn match IwatchTmuxTypingStart "^&[0-9]\+" nextgroup=IwatchTmuxTypedKeys
syn match IwatchTmuxTypingStart "^&&" nextgroup=IwatchTmuxTypedKeys
syn match IwatchTmuxTypedKeys ".*" contained contains=IwatchTmuxEscapedChar,IwatchTmuxBadEscapedChar
syn match IwatchTmuxBadEscapedChar "\\." contained
syn match IwatchTmuxEscapedChar "\\[ nt]" contained " After Bad Char to take priority over it


let b:testing_syntax = 0
if b:testing_syntax
    hi IwatchTmuxSetTargetLine ctermfg=magenta cterm=bold
    hi IwatchTmuxSetTypingSpeedLine ctermfg=green cterm=bold

    hi IwatchTMuxSendKeysStart ctermbg=red
    hi IwatchTmuxShellStart ctermbg=green
    hi IwatchTmuxTypingStart ctermbg=blue

    hi IwatchTmuxEscapedChar ctermfg=red
    hi IwatchTmuxSendKeysKeys ctermfg=green
    hi IwatchTmuxNamedKeys ctermfg=blue
else
    hi def link IwatchTmuxSetTargetLine Constant
    hi def link IwatchTmuxSetTypingSpeedLine Constant

    hi def link IwatchTMuxSendKeysStart Preproc
    hi def link IwatchTmuxShellStart Preproc
    hi def link IwatchTmuxTypingStart Preproc

    hi def link IwatchTmuxEscapedChar Keyword
    hi def link IwatchTmuxSendKeysKeys Type
    hi def link IwatchTmuxNamedKeys Keyword

endif


hi def link IwatchTmuxBadEscapedChar Error
hi def link IwatchTmuxComment Comment
hi def link IwatchTmuxError Error

let b:current_syntax = "iwatchtmux"
