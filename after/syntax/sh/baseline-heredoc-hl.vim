"
" Thankyou to github.com/acarapetis for his repo which I intend to contribute
" to once I have figured out a way to do it his way with functions and for
" loops.
"
" Explanations {{{1
" This is the version that fully works.  It does an ungodly amount of code
" repetition but it works and I will use it as a baseline for contributing
" a fully working version of this same idea to
" github.com/acarapetis/vim-sh-heredoc-highlighting.
"
" I have already started but I found some parts that don't work so for now
" I'm committing this so I can use it until I finish the fully working
" version in his repo.  At that point I will keep this just for reference
" and make acarapetis' version the one I use.
"
" Here we are just doing what sh.vim does
" - Defines 16 matchgroups to be in a heredoc, this defines 16 ways that we
"   can know that we are inside a heredoc.
" - Link all the match groups to shRedir, this makes it so the matches that
"   define the region are highlighted like redirections.
" - Add shHereDoc to the 'contains' list of shFunctionList, shCaseList,
"   shCommandSublist, and shPPSLeftList
"
" We define our 16 ways to be a python heredoc the same way except that
" the marker has to be PYTHON instead of grabbing whatever the marker is
" with \z(...\) from the start and using it in end with \z1
"
" Then we link all the matchgroups with shRedir
"
" And finally we add shHereDocHL to the contains list of the four clusters.
" The documentation says we should be able to add by using
"     syn region ... start ... end ... contains@python " containedin=@shFunctionList,...
" but I tried that and it doesn't seem to work.
"

" Load the syntaxes {{{1
let s:bcs = b:current_syntax
unlet b:current_syntax
syn include @python syntax/python.vim
unlet b:current_syntax
syn include @sh syntax/sh.vim
unlet b:current_syntax
syn include @html syntax/html.vim
let b:current_syntax = s:bcs

" Define highlighted heredocs for Python {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shPyHereDoc01 start="<<\s*PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc02 start="<<-\s*PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc03 start="<<\s*\\PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc04 start="<<-\s*\\PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc05 start="<<\s*'PYTHON'"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc06 start="<<-\s*'PYTHON'"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc07 start="<<\s*\"PYTHON\""		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc08 start="<<-\s*\"PYTHON\""		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc09 start="<<\s*\\\_$\_s*PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc10 start="<<-\s*\\\_$\_s*PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc11 start="<<\s*\\\_$\_s*\\PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc12 start="<<-\s*\\\_$\_s*\\PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc13 start="<<\s*\\\_$\_s*'PYTHON'"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc14 start="<<-\s*\\\_$\_s*'PYTHON'"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc15 start="<<\s*\\\_$\_s*\"PYTHON\""	end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc16 start="<<-\s*\\\_$\_s*\"PYTHON\""	end="^\t*PYTHON$"	contains=@python

" Link all the match groups to shRedir {{{2
hi def link shPyHereDoc01 shRedir
hi def link shPyHereDoc02 shRedir
hi def link shPyHereDoc03 shRedir
hi def link shPyHereDoc04 shRedir
hi def link shPyHereDoc05 shRedir
hi def link shPyHereDoc06 shRedir
hi def link shPyHereDoc07 shRedir
hi def link shPyHereDoc08 shRedir
hi def link shPyHereDoc09 shRedir
hi def link shPyHereDoc10 shRedir
hi def link shPyHereDoc11 shRedir
hi def link shPyHereDoc12 shRedir
hi def link shPyHereDoc13 shRedir
hi def link shPyHereDoc14 shRedir
hi def link shPyHereDoc15 shRedir
hi def link shPyHereDoc16 shRedir

" Define highlighted heredocs for Shell {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shShHereDoc01 start="<<\s*SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc02 start="<<-\s*SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc03 start="<<\s*\\SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc04 start="<<-\s*\\SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc05 start="<<\s*'SHELL'"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc06 start="<<-\s*'SHELL'"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc07 start="<<\s*\"SHELL\""		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc08 start="<<-\s*\"SHELL\""		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc09 start="<<\s*\\\_$\_s*SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc10 start="<<-\s*\\\_$\_s*SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc11 start="<<\s*\\\_$\_s*\\SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc12 start="<<-\s*\\\_$\_s*\\SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc13 start="<<\s*\\\_$\_s*'SHELL'"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc14 start="<<-\s*\\\_$\_s*'SHELL'"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc15 start="<<\s*\\\_$\_s*\"SHELL\""		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc16 start="<<-\s*\\\_$\_s*\"SHELL\""	end="^\t*SHELL$"	contains=@sh

" Link all the match groups to shRedir {{{2
hi def link shShHereDoc01 shRedir
hi def link shShHereDoc02 shRedir
hi def link shShHereDoc03 shRedir
hi def link shShHereDoc04 shRedir
hi def link shShHereDoc05 shRedir
hi def link shShHereDoc06 shRedir
hi def link shShHereDoc07 shRedir
hi def link shShHereDoc08 shRedir
hi def link shShHereDoc09 shRedir
hi def link shShHereDoc10 shRedir
hi def link shShHereDoc11 shRedir
hi def link shShHereDoc12 shRedir
hi def link shShHereDoc13 shRedir
hi def link shShHereDoc14 shRedir
hi def link shShHereDoc15 shRedir
hi def link shShHereDoc16 shRedir

" Define highlighted heredocs for HTML {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shHTMLHereDoc01 start="<<\s*HTML"		end="^HTML$"		contains=@html,@shDblQuoteList
syn region shHereDocHL matchgroup=shHTMLHereDoc02 start="<<-\s*HTML"		end="^\t*HTML$"		contains=@html,@shDblQuoteList
syn region shHereDocHL matchgroup=shHTMLHereDoc03 start="<<\s*\\HTML"		end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc04 start="<<-\s*\\HTML"		end="^\t*HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc05 start="<<\s*'HTML'"		end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc06 start="<<-\s*'HTML'"		end="^\t*HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc07 start="<<\s*\"HTML\""		end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc08 start="<<-\s*\"HTML\""		end="^\t*HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc09 start="<<\s*\\\_$\_s*HTML"		end="^HTML$"		contains=@html,@shDblQuoteList
syn region shHereDocHL matchgroup=shHTMLHereDoc10 start="<<-\s*\\\_$\_s*HTML"		end="^\t*HTML$"		contains=@html,@shDblQuoteList
syn region shHereDocHL matchgroup=shHTMLHereDoc11 start="<<\s*\\\_$\_s*\\HTML"		end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc12 start="<<-\s*\\\_$\_s*\\HTML"		end="^\t*HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc13 start="<<\s*\\\_$\_s*'HTML'"		end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc14 start="<<-\s*\\\_$\_s*'HTML'"		end="^\t*HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc15 start="<<\s*\\\_$\_s*\"HTML\""	end="^HTML$"		contains=@html
syn region shHereDocHL matchgroup=shHTMLHereDoc16 start="<<-\s*\\\_$\_s*\"HTML\""	end="^\t*HTML$"		contains=@html

" Link all the match groups to shRedir {{{2
hi def link shHTMLHereDoc01 shRedir
hi def link shHTMLHereDoc02 shRedir
hi def link shHTMLHereDoc03 shRedir
hi def link shHTMLHereDoc04 shRedir
hi def link shHTMLHereDoc05 shRedir
hi def link shHTMLHereDoc06 shRedir
hi def link shHTMLHereDoc07 shRedir
hi def link shHTMLHereDoc08 shRedir
hi def link shHTMLHereDoc09 shRedir
hi def link shHTMLHereDoc10 shRedir
hi def link shHTMLHereDoc11 shRedir
hi def link shHTMLHereDoc12 shRedir
hi def link shHTMLHereDoc13 shRedir
hi def link shHTMLHereDoc14 shRedir
hi def link shHTMLHereDoc15 shRedir
hi def link shHTMLHereDoc16 shRedir

" Add shHereDocHL to the same clusters that contain shHereDoc {{{1
syn cluster shCaseList	contains=@shCommandSubList,shCaseEsac,shColon,shCommandSub,shCommandSubBQ,shSubshare,shValsub,shComment,shDblBrace,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shCtrlSeq,shHereDocHL
syn cluster shCommandSubList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shComment,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL
" syn cluster shFunctionList	contains=shBracketExpr,@shCommandSubList,shCaseEsac,shColon,shComment,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shOption,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shOperator,shCtrlSeq
syn cluster shPPSLeftList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shSubshare,shValsub,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL

" vim: ts=16 fdm=marker
