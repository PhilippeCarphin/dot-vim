" CREDIT: https://github.com/acarapetis/vim-sh-heredoc-highlighting/
"         The authors of vim's syntax/sh.vim
" AUTHOR: Philippe Carphin
"
" NOTE: This file cannot be named sh.vim because of the
"       syn include @sh syntax/sh.vim
"
"
" Load the python syntax.  This allows us to do `contains=@python` which
" otherwise would not be possible since python syntax doesn't get loaded for
" files that aren't python.
let s:bcs = b:current_syntax
unlet b:current_syntax
syn include @python syntax/python.vim
unlet b:current_syntax
syn include @sh syntax/sh.vim
let b:current_syntax = s:bcs

" We define a region shPyHereDoc and two ways of determining that we are in
" that region.  Bash defines 16 ways for shHereDoc but most of them are
" things that we would never encounter and the BASH manpage doesn't even
" know they exist.

function! DefineHereDoc(marker, syntax)
    let s:bcs = b:current_syntax
    unlet b:current_syntax
    " Load the relavant syntax file
    execute "syntax include @" . a:syntax . " syntax/" . a:syntax . ".vim"
    let b:current_syntax = s:bcs

    """ Markers on same line
    " Plain, indented and unindented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc01 start=+<<\\s*" . a:marker . "+		end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc02 start=+<<-\\s*" . a:marker . "+		end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Plain, unindented and indented, with backslash before marker
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc03 start=+<<\\s*\\" . a:marker . "+		end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc04 start=+<<-\\s*\\" . a:marker . "+		end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Single quote, unindented and indented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc05 start=+<<\\s*'" . a:marker . "'+		end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc06 start=+<<-\\s*'" . a:marker . "'+		end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Double quote, unindented and indented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc07 start=+<<\\s*\"" . a:marker . "\"+		end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc08 start=+<<-\\s*\"" . a:marker . "\"+		end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax

    """ Backslash on first line, marker on next line
    " Plain, indented and unindented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc09 start=+<<\\s*\\\\\\_$\\_s*" . a:marker . "+	end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc10 start=+<<-\\s*\\\\\\_$\\_s*" . a:marker . "+	end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Plain, unindented and indented, with backslash before marker
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc11 start=+<<\\s*\\\\\\_$\\_s*\\\\" . a:marker . "+	end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc12 start=+<<-\\s*\\\\\\_$\\_s*\\\\" . a:marker . "+	end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Single quote, unindented and indented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc13 start=+<<\\s*\\\\\\_$\\_s*'" . a:marker . "'+	end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc14 start=+<<-\\s*\\\\\\_$\\_s*'" . a:marker . "'+	end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax
    " Double quote, unindented and indented
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc15 start=+<<\\s*\\\\\\_$\\_s*\"" . a:marker . "\"+	end=+^" . a:marker . "$+	contains=@" . a:syntax
    execute "syn region shHereDocHL matchgroup=sh" . a:marker . "HereDoc16 start=+<<-\\s*\\\\\\_$\\_s*\"" . a:marker . "\"+	end=+^\\t*" . a:marker . "$+	contains=@" . a:syntax

    """ Link all of them to shRedir
    for i in ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16']
        execute "hi def link sh" . a:marker . "HereDoc" . i . " shRedir"
    endfor
endfunction


" syn cluster shFunctionList   add=shHereDocHL
" syn cluster shCaseList       add=shHereDocHL
" syn cluster shCommandSublist add=shHereDocHL
" syn cluster shPPSLeftList    add=shHereDocHL

call DefineHereDoc("PYTHON", "python")

call DefineHereDoc("SHELL", "sh")

syn cluster shCaseList	contains=@shCommandSubList,shCaseEsac,shColon,shCommandSub,shCommandSubBQ,shSubshare,shValsub,shComment,shDblBrace,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shCtrlSeq,shHereDocHL
syn cluster shCommandSubList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shComment,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL
syn cluster shFunctionList	contains=shBracketExpr,@shCommandSubList,shCaseEsac,shColon,shComment,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shOption,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shOperator,shCtrlSeq,shHereDocHL
syn cluster shPPSLeftList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shSubshare,shValsub,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL

" We link the match groups with shRedir which sh.vim does for each of the
" 16 shHereDoc{01..16}.  This makes the matched parts delimiting the region
" colored like they would be for normal heredocs.
" hi def link shPyHereDoc02 shRedir
" hi def link shPyHereDoc10 shRedir
" hi def link shShHereDoc02 shRedir
" hi def link shShHereDoc10 shRedir

" syn cluster shFunctionList   add=shHereDocHL
" syn cluster shCaseList       add=shHereDocHL
" syn cluster shCommandSublist add=shHereDocHL
" syn cluster shPPSLeftList    add=shHereDocHL


" The above is enough to highlight python heredocs in python syntax when they
" are not inside some other region.  To handle this, we look for all the lines
" of the form `syn cluster () contains=...,shHereDoc,...` and say that those
" things can also contain shPyHereDoc.  With this we can have highlighted
" heredocs inside functions and other things.
syn cluster shCaseList	contains=@shCommandSubList,shCaseEsac,shColon,shCommandSub,shCommandSubBQ,shSubshare,shValsub,shComment,shDblBrace,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shCtrlSeq,shHereDocHL
syn cluster shCommandSubList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shComment,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL
syn cluster shFunctionList	contains=shBracketExpr,@shCommandSubList,shCaseEsac,shColon,shComment,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shOption,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shOperator,shCtrlSeq,shHereDocHL
syn cluster shPPSLeftList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shSubshare,shValsub,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL
" How I made this:  Nowadays AI could have probably figured it out but I
" wanted to do it myself.  Here is the progression.
"
" Before vim 9.1, the syntax highlighting for indented heredocs (<<-) allowed
" the end marker to have spaces or tabs between it and the start of the line.
" I use them a lot and the highlighting lets you know right away if you have a
" mistake.
"
" So I looked in the shipped syntax/sh.vim and found the that the indented
" heredoc matches were `start="<<-\s*\z([^ \t|>]\+\)` and `end="^\s*\z1$"` so
" I made myself a copy in my `~/vim/after/syntax/sh.vim` with those end marker
" expressions fixed: `end="^\t*\z1$"`.
"
" Then I found out vim 9.1 already had this fixed so I just got the sh.vim
" from there and put it in my `~/.vim/after/syntax/sh.vim`.
"
" Later I wondered if heredocs could be highlighted with a specific syntax
" since natively vim's markdown syntax highlighting can highlight source code
" blocks in varous languages.
"
" Googled for 'vim syntax highlighted heredocs', it showed me a plugin
" https://github.com/acarapetis/vim-sh-heredoc-highlighting/
"
" In this plugin he has a function that takes a marker (PYTHON) and a syntax
" name (python) and
" - Loads the named syntax while preserving and resetting b:current_syntax
" - In a for loop, does 3 times the line for shPyHereDoc02 for each type of
"   quote cat <<PYTHON, cat <<'PYTHON', and cat <<"PYTHON".
"
" This plugin had a few drawbacks:
" 1. The markers were not highlighted like for regulare heredocs
" 2. Indented heredocs were not handled: the plugin uses `start="<<[-]\?"`
"    to handle indented and unindented cases and allows any type of space
"    in front of the end marker
" 3. By not doing any of the `syn cluster shCommandSublist contains=...`
"    the highlighting doesn't work
" vim: ts=16 fdm=marker
