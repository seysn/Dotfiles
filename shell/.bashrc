# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable touchscreen
xinput set-prop 'USBest Technology SiS HID Touch Controller' 'Device Enabled' 0

# screenFetch
screenfetch && echo

# mask rwxr-xr-x
umask 022

# keyboard Layout French
setxkbmap fr

# path
export PATH=${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/binx:/sbin:/bin:/home/seysn/scripts:/usr/bin/X11:${PATH}

# avoid errors
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# some shortcuts
alias git='LANG=en_GB git'
alias ls='ls -h --color=auto'
alias la='ls -alh --color=auto'
alias ll='ls -lh --color=auto'
alias df="df -h"
alias color='export COLOR=--color'
alias nocolor='export COLOR='
alias feh='feh -F'
alias subl='subl3'
alias subl2='/home/seysn/SublimeText2/sublime_text 2>/dev/null'
alias ssubl='sudo /home/seysn/SublimeText2/sublime_text'
alias idea="/home/seysn/Documents/idea-IU-141.178.9/bin/idea.sh"
alias androidstudio="/home/seysn/Documents/android-studio/bin/studio.sh"
alias netbeans="/home/seysn/Documents/netbeans-8.0.2/bin/netbeans"

# ex - archive extractor
ex () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.tar.xz)    tar xf $1    ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1   ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*)           echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# load other alias and functions
test -r $HOME/.alias && source $HOME/.alias

# personnal prompt
export PS1='\[\033[31;1m\][\u@\h]\[\033[32;1m\] \w\[\033[34;1m\] $ \[\033[0m\]'

# old Prompt
# export PS1="\[\e[01;36m\]\u:\[\e[0m\]\[\e[01;33m\][\w]\[\e[0m\]\[\e[00;37m\]: \[\e[0m\]"
# export PS1="\[\033[1;34m\]\u@\h \[\033[1;32m\]\w $ \[\e[0m\]"

# less export
export LESS="-S "
export LESSBINFMT='*u#'

# list and date history
shopt -s histappend
unset HISTFILESIZE
export HISTFILESIZE
unset HISTCONTROL
export HISTTIMEFORMAT="%s "
export PROMPT_COMMAND="history -a ; "'echo $$ ${USER} "$(history 1)" >> ~/.bash_eternal_history'

# check size of shell
shopt -s checkwinsize

# auto-completion
test -r  /etc/bash_completion && source /etc/bash_completion

# end

