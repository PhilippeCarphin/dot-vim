
syn match philGroupListEquals contained "=" skipwhite skipnl nextgroup=saladGroupListContinueStart, saladGroupList
hi philGroupListEquals ctermbg=red

syn keyword saladFruitValue apple apricot banana cherry
syn keyword saladVegetableValue celery carrot onion potato
syn match saladFruit "fruit="he=e-1 nextgroup=saladError,saladFruitValue
syn match saladVegetable "vegetable="he=e-1 nextgroup=saladError,saladVegetableValue
syn match saladError contained "\D\i*"
hi saladFruitValue ctermfg=blue
hi saladFruit ctermfg=yellow
hi saladVegetable ctermfg=green
hi saladVegetableValue ctermfg=cyan
hi saladError ctermbg=green

 syn match	vimHiCtermError	contained	"\D\i*"
syn match	vimGroupListEquals	contained	"="		skipwhite skipnl nextgroup=vimGroupListContinueStart,vimGroupList

syn region	vimGroupList	contained
      \ start="\S"
      \ skip=+\n\s*\%(\\\|["#]\\ \)+
      "\ need to consume the whitespace
      \ end="\s"he=e-1
      \ end="$"
      \ contains=@vimGroupListContinue,vimGroupSpecial,vimGroupListContinueComma
syn match	vimGroupListEquals	contained	"="		skipwhite skipnl nextgroup=vimGroupListContinueStart,vimGroupList
syn match	vimGroupListContinueStart	contained	"^\%(\s*["#]\\ .*\n\)*\s*\\\s\+"	skipwhite        nextgroup=vimGroupList contains=@vimGroupListContinue transparent
syn match	vimHiCtermFgBg	contained	"\ccterm[fb]g="he=e-1	nextgroup=vimHiNmbr,vimHiCtermColor,vimFgBgAttrib,vimHiCtermError

 hi def link vimHiCtermFgBg	vimHiTerm
syn cluster	vimHiCluster contains=vimGroup,vimHLGroup,vimHiGroup,vimHiNone,vimHiTerm,vimHiCTerm,vimHiStartStop,vimHiCtermFgBg,vimHiCtermul,vimHiCtermfont,vimHiGui,vimHiGuiFont,vimHiGuiFgBg,vimHiKeyError,vimNotation,vimComment,vim9Comment
syn match	vimHiCtermFgBg	contained	"\ccterm[fb]g="he=e-1	nextgroup=vimHiNmbr,vimHiCtermColor,vimFgBgAttrib,vimHiCtermError
syn match	vimHiCtermul	contained	"\cctermul="he=e-1	nextgroup=vimHiNmbr,vimHiCtermColor,vimFgBgAttrib,vimHiCtermError
syn match	vimHiCtermfont	contained	"\cctermfont="he=e-1	nextgroup=vimHiNmbr,vimHiCtermColor,vimFgBgAttrib,vimHiCtermError

 hi def link vimHiCtermColor	Constant
syn keyword	vimHiCtermColor	contained	black blue brown cyan darkblue darkcyan darkgray darkgreen darkgrey darkmagenta darkred darkyellow gray green grey grey40 grey50 grey90 lightblue lightcyan lightgray lightgreen lightgrey lightmagenta lightred lightyellow magenta red seagreen white yellow
syn match	vimHiCtermColor	contained	"\<color\d\{1,3}\>"


