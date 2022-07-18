" Vim syntax file
"
" Language:     hcron file
" Maintainer:   John Marshall
"
" Last Change:  2010-12-15
"
" Highlights:
" * generic field settings
" * when_* field settings (separately from generic)
" * include "..." directive
" * special $HCRON_* variable names
" * comment lines

syn case match

syn match       hcronGenericField       /^[a-zA-Z_]*=/
syn match       hcronWhenField          /^when_\(year\|month\|day\|hour\|minute\|dow\)=/
syn match       hcronDirective          /^include .*$/
syn match       hcronVariable           /\$HCRON_[A-Z_]*/
syn match       hcronComment            /^#.*/

hi def link     hcronDirective          Define
hi def link     hcronVariable           Identifier
hi def link     hcronGenericField       Type
hi def link     hcronWhenField          String
hi def link     hcronComment            Comment
