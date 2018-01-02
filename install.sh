#!/bin/bash

COPY_METHOD="ln -s"
MISSING=()
RST='\033[0m'
CYAN='\033[0;36m'

rmdir backup 2>/dev/null
if [ -e backup ]
then
    echo "A folder \"backup\" already exist"
    echo "Remove it or rename it"
    exit -1
fi
mkdir backup

confirm() {
    read -r -p "${1:-Are you sure?} [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

install_zsh() {
    which zsh >/dev/null || MISSING+=("zsh")
    [ -e ~/.zshrc ] && mv ~/.zshrc backup && echo ".zshrc moved in backup"
    [ -e ~/.antigenrc ] && mv ~/.antigenrc backup && echo ".antigenrc moved in backup"
    [ -e /usr/share/zsh/share/antigen.zsh ] || MISSING+=('antigen.zsh')
    $COPY_METHOD $(pwd)/shell/zshrc ~/.zshrc
    $COPY_METHOD $(pwd)/shell/antigenrc ~/.antigenrc
    echo "zshrc installed"
}

install_emacs() {
    which emacs >/dev/null || MISSING+=('emacs')
    [ -e ~/.emacs ] && mv ~/.emacs backup && echo ".emacs moved in backup"
    [ -e ~/.emacs.d ] && mv ~/.emacs.d backup && echo ".emacs.d moved in backup"
    curl -L https://git.io/epre | sh
    rm -f ~/.emacs.d/personal/custom.el
    $COPY_METHOD $(pwd)/emacs/prelude.el ~/.emacs.d/personal/custom.el
    echo "emacs/prelude installed"
}

install_i3() {
    which i3 >/dev/null || MISSING+=('i3')
    [ -e ~/.i3/config ] && mv ~/.i3/config backup/i3config && echo ".i3/config moved in backup" [ -e ~/.config/i3/config ] && mv ~/.config/i3/config backup/i3config2 && echo ".config/i3/config moved in backup"
    mkdir ~/.config/i3 >/dev/null
    $COPY_METHOD $(pwd)/i3/config ~/.config/i3/config
    echo "i3 conf installed"
}

install_xresources() {
    which urxvt >/dev/null || MISSING+=('urxvt')
    [ -e ~/.Xresources ] && mv ~/.Xresources backup && echo ".Xresources moved in backup"
    $COPY_METHOD $(pwd)/shell/Xresources ~/.Xresources
    echo "Xresources installed"
}

install_fonts() {
    git clone https://github.com/Tecate/bitmap-fonts /tmp/bitmap-fonts
    sudo cp -avr /tmp/bitmap-fonts/bitmap/ /usr/share/fonts
    xset fp+ /usr/share/fonts/bitmap
    fc-cache -fv
    echo "Fonts installed"
}

install_polybar() {
    which polybar >/dev/null || MISSING+=('polybar')
    [ -e ~/.config/polybar/ ] && mv ~/.config/polybar/* backup || mkdir ~/.config/polybar
    $COPY_METHOD $(pwd)/polybar/config ~/.config/polybar/config
    $COPY_METHOD $(pwd)/polybar/launch.sh ~/.config/polybar/launch.sh
    echo "Polybar conf installed"
}

install_redshift() {
    which redshift >/dev/null || MISSING+=('redshift')
    [ -e ~/.config/redshift.conf ] && mv ~/.config/redshift.conf backup/
    $COPY_METHOD $(pwd)/redshift.conf ~/.config/redshift.conf
    echo "Redshift conf installed"
}

confirm "Zsh comes with antigen. Install zsh conf ?" && install_zsh
confirm "Emacs conf comes with Prelude. Install Prelude ?" && install_emacs
confirm "Install i3 conf ?" && install_i3
confirm "Install Xresources ?" && install_xresources
confirm "Install fonts ?" && install_fonts
confirm "Install polybar ?" && install_polybar
confirm "Install redshift conf ?" && install_redshift
[ -n "$MISSING" ] && echo -e "Don't forget to install : ${CYAN}${MISSING[*]}${RST}"

rmdir backup 2>/dev/null
