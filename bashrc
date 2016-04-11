echo "** Loading \$HOME/.profile.d/interactive/post **"

# ALL

   . ~/.git-prompt.sh
   alias profile="vim $HOME/.bashrc"
   alias lprofile=". $HOME/.profile.d/interactive/post"
   alias cd..='cd ..'
   alias dusage='du --max-depth=1 | sort -n'
   alias gitk="gitk --all"
   alias vgrindtotmem="valgrind --tool=massif --stacks=yes"
   alias vgrind="valgrind --tool=memcheck --leak-check=yes"
   alias lprofile=". $HOME/.profile.d/interactive/post"
   export CDPATH=$CDPATH:$HOME/Documents/GitCMC/:$HOME/Documents/Experiences/:$HOME
   export PATH=$HOME/.local/cmake-3.5.0-rc1-Linux-x86_64/bin:$HOME/.local/bin/:$HOME/Documents/test/:$PATH
   export EDITOR=vim
   export FCEDIT=vim


   cdl () {
       cd "$(dirname "$(readlink "$1")")";
   }
   set -o vi

if [ "$CMCLNG" == english ]; then
   echo "   Loading CMC commands "
   . ssmuse-sh -d cmoi/apps/git/20150526
   . ssmuse-sh -d cmoi/apps/git-procedures/20150622
   . ssmuse-sh -d /ssm/net/isst/maestro/1.4.3-rc4
   alias runxp=/users/dor/afsi/dor/ovbin/i686/runxp 
   alias xflow_overviewSuites="xflow_overview -suites ~afsiops/xflow.suites.xml;echo allo"
   alias mcompile='export SEQ_EXP_HOME=$HOME/Documents/Experiences/compilation && /ssm/net/isst/maestro/1.4.3-rc4/maestro_1.4.3_ubuntu-12.04-amd64-64/bin/maestro -d 20160119000000 -n /compile -s submit -f continue & '
   alias xcompile='export SEQ_EXP_HOME=$HOME/Documents/Experiences/compilation && xflow &'
   alias runxp_phil='/usr/bin/rdesktop -a 16 -r sound:local -g 1500x1100 eccmcwts3'
   alias dmaestro="cd /users/dor/afsi/dor/tmp/maestro_depot/"
   alias ssmtest='. ssmuse-sh -d /users/dor/afsi/phc/Testing/testdomain'
   alias exportssmtest='export SEQ_MAESTRO_SHORTCUT=". ssmuse-sh -d /users/dor/afsi/phc/Testing/testdomain"'
   alias cmc_origin=/home/ordenv/GIT-DEPOTS/impl/isst
   export CMCLNG=english
   export SEQ_MAESTRO_SHORTCUT=". ssmuse-sh -d /ssm/net/isst/maestro/1.4.3-rc4"
   export SEQ_TRACE_LEVEL=1:TL_FULL_TRACE
   export domain="/users/dor/afsi/phc/Testing/testdomain"
fi

if [ "$BASH" != "" ]; then 
   echo "   Loading bash specific commands"
   PS1='\[\e[0;32m\][\u@\h \W\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0;32m\]] \$ \[\e[0m\]'
   [ -z "$TMUX" ] && export TERM=xterm-256color
   . ~/.git-completion.bash 
   export HISTFILESIZE=
   export HISTSIZE=
else
   echo "   Loading non-bash commands (possibly ksh)"
   ulimit -St unlimited
	PS1='$(echo -e "\033[32m${LOGNAME} @ ${HOSTNAME} ${PWD##*/}\033[35m$(__git_ps1 " (%s)")\033[32m $ \033[00m")'
	alias history='fc -l 1 100000'
	alias __A=$(print '\0020') # ^P = up = previous command
	alias __B=$(print '\0016') # ^N = down  = next command
	alias __C=$(print '\0006') # ^F = right = forward a character
	alias __D=$(print '\0002') # ^B = left = back a character
	alias __H=$(print '\0001') # ^A = home = beginning of line
	alias __Y=$(print '\0005') # ^E = end = end of line
fi

if [ "$BASH" == TODO ]; then # We're at polytechnique
   echo "   Loading polytechnique commands"
   alias INF1995='firefox http://www.groupes.polymtl.ca/inf1995/tp/'
   alias docAtmel='gvfs-open ~/Documents/docAtmel.pdf'
   # Put the PDF of the Atmel documentation in the documents folder.

   alias docAVRLibC='firefox http://www.nongnu.org/avr-libc/user-manual/index.html'
   alias chrome='google-chrome'
   alias INF1995='google-chrome http://www.groupes.polymtl.ca/inf1995/tp/'
   alias hotmail='google-chrome www.hotmail.com'
   alias ssh-school='ssh l4712-05.info.polymtl.ca -l phcarb'
fi

if [ `uname` = Linux ]; then
   echo "   Loading Linux commands"
	alias ls='ls --color'
elif [ `uname` = Darwin ]; then
   echo "   Loading Darwin commands"   
	alias ls='ls -G'
elif [ $(uname) = AIX ]; then
   echo "   Loading AIX commands"   
   if [ "$BASH" = "" ]; then
      PS1="${LOGNAME} @ ${HOSTNAME} "'!) '
   fi
	alias vim=vi
	alias gvim=vi
fi
