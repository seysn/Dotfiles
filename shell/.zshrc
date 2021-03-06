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
export PATH="$GOPATH/bin:$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:${PATH}"

# some shortcuts
alias git='LANG=en_GB git'
alias df="df -h"
alias feh='feh -F'
alias ping='ping -O'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias gas='/usr/bin/as'
alias wifi='nmcli radio wifi'
alias ed="emacs --daemon"
alias e='emacsclient -c'
alias et='emacsclient -t'
alias ip='ip -color'
export VISUAL='vim'

twitch () {
    if [ -n "$1" ] ; then
        if [ -n "$2" ] ; then
            streamlink twitch.tv/$1 $2
        else
            streamlink twitch.tv/$1 best
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
    echo "Proxy is ON"
}
alias pon='proxy_on'

proxy_off () {
    unset http_proxy
    unset https_proxy
    echo "Proxy is OFF"
}
alias poff='proxy_off'

# Disabling zsh autocorrection
unsetopt correct_all

# No more GUI for askpass
unset SSH_ASKPASS
