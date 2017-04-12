#!/bin/bash

# Message from Phil, for people that are new to git and bash, this may seem
# confusing to you, but I encourage you to look at the commands and try to
# understand what is happening.

# The weirdest thing is the [ -e ... -o -L ] and what that does is that in [ ],
# it is a test and it reads like this :
# " -e (is a file) file -o (or) -L (is a link) file"
# so basically, this checks if the file exists whether it's a regular file or a
# link.

# The rest of the commands are self documented by an echo statement right before
# it.  You should look up what the >> operator does. HINT: google 'bash io
# redirection'

# The last tricky thing is the use of grep. The grep command takes a string as
# first argument and then a list of files.  It outputs the lines that contain
# the string.  And $(cmd) "captures" the output of grep.  The test says "If the
# output of the grep command is empty".  The grep command is super useful to
# search through code and other files because it also supports regular
# expressions.

# Shourld always be .bashrc and ~ but for testing purposes, it is useful to be
# able to change them.
bashrc=.bashrc
dir=~

################################################################################
# If the file exists, nothing is done, otherwise, wget is used to download the
# file, rename it as a hidden file (putting a '.' in front of it), then a line
# is added to bashrc to source the file.
################################################################################
get_and_source(){
	local file_url=$1
	local file=$2
	if [ -e "$dir/.$file" -o -L "$dir/.$file" ]; then
		echo ".$file already present in home directory"
	else
		echo "Downloading file from $file_url"
		wget $file_url > /dev/null 2>&1
		echo "Renaming $file to ~/.$file"
		mv $file $dir/.$file
		echo "Adding 'source ~/.$file' to ~/.bashrc"
		echo "source $dir/.$file" >> $dir/$bashrc
	fi
}

# git-prompt.sh will allow us to display the current branch in the prompt string
# by using the function __git_ps1
git_prompt_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
git_prompt_file=git-prompt.sh
get_and_source $git_prompt_url $git_prompt_file

# git-completion.bash will allow us to have autocompletion of git commands and
# branch names by pressing tab.
git_completion_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
git_completion_file=git-completion.bash
get_and_source $git_completion_url $git_completion_file

# This next part appends the content of the variable phil_colors to the bashrc
# with a check that it has not already been done.
phil_colors="
# Define colors for making prompt string.
# Phil_PS1
# Vous pouvez changer les couleurs en changeant les nombres (htt
green='\[\e[32m\]'
yellow='\[\e[33m\]'
purple='\[\e[35m\]'
no_color='\[\e[m\]'
PS1=\$green'[\u@\h \W'\$yellow'\$(__git_ps1 \" (%s)\")'\$green'] \\$ '\$no_color"

if [[ "$(grep Phil_PS1 $dir/$bashrc)" == "" ]]; then
	echo "Adding Phil_colors to ~/.bashrc"
	echo "$phil_colors" >> $dir/$bashrc
else
	echo "Phil_PS1 already added to bashrc"
fi

source $dir/$bashrc
