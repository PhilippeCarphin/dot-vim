" Vim syntax file
" Language:     OpenSSH public key
" Author:       Fionn Fitzmaurice (github.com/fionn)
" Maintainer:   Fionn Fitzmaurice (github.com/fionn)
" License:      Vim & Apache 2.0
" Last Change:  2026 Jun 28
" 2026 Sep 27 by Vim project: Add a new SSH key type
" 2026 Sep 28 by Vim project: update syntax file

if exists("b:current_syntax")
    finish
endif

syn iskeyword _,.,@-@,-,a-z,A-Z,48-57

syn keyword sshKeyType ssh-mldsa44-ed25519 nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType ssh-mldsa44-ed25519@openssh.com nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType ssh-ed25519 nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType sk-ssh-ed25519@openssh.com nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType ecdsa-sha2-nistp256 nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType ecdsa-sha2-nistp384 nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType ecdsa-sha2-nistp521 nextgroup=sshKeyBase64Encoded skipwhite
syn keyword sshKeyType sk-ecdsa-sha2-nistp256@openssh.com nextgroup=sshKeyBase64Encoded skipwhite

" Testing setting specific lengths for ssh keys
syn keyword sshKeyType ssh-rsa nextgroup=rsa372,rsa544,rsa716,rsaOopsie skipwhite
syn match rsa716 "AAAA[a-zA-Z0-9/+]\{710}=\{2}\_\s"me=e-1 contained nextgroup=sshKeyComment
syn match rsa544 "AAAA[a-zA-Z0-9/+]\{539}=\{1}\_\s"me=e-1 contained nextgroup=sshKeyComment
syn match rsa372 "AAAA[a-zA-Z0-9/+]\{368}=\{0}\_\s"me=e-1 contained nextgroup=sshKeyComment
hi rsaOopsie ctermbg=blue
hi rsa372 ctermbg=darkyellow
hi rsa544 ctermbg=red
hi rsa716 ctermbg=darkred
" hi def link rsa372 String
" hi def link rsa544 String
" hi def link rsa716 String

syn match sshKeyBase64Encoded "AAAA[a-zA-Z0-9/+]\{64,8000}=\{,2}" contained nextgroup=sshKeyComment
syn match sshKeyComment ".*$" contained
syn match sshKeyComment "#.*$"

hi def link sshKeyType Type
hi def link sshKeyEdBase64Encoded64 Macro
hi def link sshKeyBase64Encoded String
hi def link sshKeyBase64Encoded String
hi def link sshKeyBase64Encoded String
hi def link sshKeyComment Comment

let b:current_syntax = "sshpublickey"
