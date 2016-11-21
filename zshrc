# Load antigen with its config
source ~/.antigenrc

# Screenfetch
#screenfetch && echo

# mask rwxr-xr-x
umask 022

# keyboard Layout French
#setxkbmap fr

# Path
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/seysn/Documents/Courses/ARO/ampl:${PATH}"

# avoid errors
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# some shortcuts
alias git='LANG=en_GB git'
alias ls='ls -hF --color=auto'
alias la='ls -alhF --color=auto'
alias ll='ls -lhF --color=auto'
alias df="df -h"
alias color='export COLOR=--color'
alias nocolor='export COLOR='
alias feh='feh -F'
alias subl='subl3'
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias ping='ping -O'
#alias steam='STEAM_RUNTIME=0 steam'
export VISUAL='vim'

twitch () {
	if [ -n "$1" ] ; then
		if [ -n "$2" ] ; then
			livestreamer --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6 twitch.tv/$1 $2
		else
			livestreamer --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6 twitch.tv/$1 high
		fi
	fi
}

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

proxy_on () {
	export http_proxy=http://proxy.univ-lille1.fr:3128;	
	export https_proxy=https://proxy.univ-lille1.fr:3128;
	echo "Acquire::http::Proxy \"http://proxy.univ-lille1.fr:3128\";" > /etc/apt/apt.conf.d/proxy
	echo "Proxy is ON"
}
alias pon='proxy_on'

proxy_off () {
	unset http_proxy
	unset https_proxy
	echo "" > /etc/apt/apt.conf.d/proxy
	echo "Proxy is OFF"
}
alias poff='proxy_off'

# Disabling zsh autocorrection
unsetopt correct_all
