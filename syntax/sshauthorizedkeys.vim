" Vim syntax file
" Language:     OpenSSH authorized keys file
" Author:       Fionn Fitzmaurice (github.com/fionn)
" Maintainer:   Fionn Fitzmaurice (github.com/fionn)
" License:      Vim & Apache 2.0
" Last Change:  2026 Jun 28
" 2026 Sep 28 by Vim project: update syntax file #21387

if exists("b:current_syntax")
    finish
endif

syn keyword sshAuthorizedKeyBoolOption agent-forwarding		contained
syn keyword sshAuthorizedKeyBoolOption cert-authority		contained
syn keyword sshAuthorizedKeyBoolOption no-agent-forwarding	contained
syn keyword sshAuthorizedKeyBoolOption no-port-forwarding	contained
syn keyword sshAuthorizedKeyBoolOption no-pty				contained
syn keyword sshAuthorizedKeyBoolOption no-user-rc			contained
syn keyword sshAuthorizedKeyBoolOption no-X11-forwarding	contained
syn keyword sshAuthorizedKeyBoolOption pty					contained
syn keyword sshAuthorizedKeyBoolOption no-touch-required	contained
syn keyword sshAuthorizedKeyBoolOption verify-required		contained
syn keyword sshAuthorizedKeyBoolOption restrict				contained
syn keyword sshAuthorizedKeyBoolOption user-rc				contained
syn keyword sshAuthorizedKeyBoolOption X11-forwarding		contained
syn keyword sshAuthorizedKeyBoolOption port-forwarding		contained

syn keyword sshAuthorizedKeyValueOption command				contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption environment			contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption expiry-time			contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption from				contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption permitlisten		contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption permitopen			contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption principals			contained	nextgroup=sshAuthorizedKeyOptionAssignment
syn keyword sshAuthorizedKeyValueOption tunnel				contained	nextgroup=sshAuthorizedKeyOptionAssignment

syn match sshAuthorizedKeyRestError ".*" contained

syn region sshAuthorizedKeyOptions start="[a-z]" end="\s\+"he=e-1 contains=sshAuthorizedKeyValueOption,sshAuthorizedKeyOptionSeparator,sshAuthorizedKeyBoolOption nextgroup=sshKeyType,sshAuthorizedKeyRestError
syn match sshAuthorizedKeyOptionSeparator "," contained
syn match sshAuthorizedKeyOptionAssignment "=" contained nextgroup=sshAuthorizedKeyOptionValue
syn match sshAuthorizedKeyOptionValue '"\(\\\"\|[^"]\)*"' contained

runtime! syntax/sshpublickey.vim

let g:testing = 0
if g:testing
    hi sshAuthorizedKeyRestError		ctermbg=red		ctermfg=blue
    hi sshAuthorizedKeyOptions			ctermbg=white	ctermfg=black
    hi sshAuthorizedKeyBoolOption		ctermbg=green
    hi sshAuthorizedKeyValueOption		ctermbg=cyan
    hi sshAuthorizedKeyOptionAssignment	ctermbg=magenta
    hi sshAuthorizedKeyOptionValue		ctermbg=blue
    hi sshAuthorizedKeyOptionSeparator	ctermbg=red
else
    hi def link sshAuthorizedKeyRestError			Error
    hi def link sshAuthorizedKeyOptions				Error
    hi def link sshAuthorizedKeyBoolOption			Keyword
    hi def link sshAuthorizedKeyValueOption			Keyword
    hi def link sshAuthorizedKeyOptionAssignment	Operator
    hi def link sshAuthorizedKeyOptionValue			String
    hi def link sshAuthorizedKeyOptionSeparator		Delimiter
endif

let b:current_syntax = "sshauthorizedkeys"
