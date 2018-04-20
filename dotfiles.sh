#!/bin/zsh

# Symlink dotfiles from the Git repo to $HOME, where they can
# be used at will by applications that need them.

if [ $(basename $PWD) != "dotfiles" ] || [ -d dotfiles ] ; then
    echo "This script is meant to be run inside ./dotfiles."
    exit
fi

# Skip .a* (aliases) and .g* (git) for now, and skip "dotfiles/..".
# Idea gronked from edunham/dotfiles.
for i in .[^.ag]*
do
    ln -vs $HOME/dotfiles/$i $HOME
done

# Link CERTAIN .a* and .g* files.
ln -vs $HOME/dotfiles/.aliases $HOME
ln -vs $HOME/dotfiles/.gitignore_global $HOME
ln -vs $HOME/dotfiles/.gitconfig $HOME

# Sometimes I have to force names: "NAME=Fedora ./dotfiles/dotfiles_import.sh"
if [ ! "$NAME" ]; then
    source /etc/os-release 2>/dev/null
    if [ $? != 0 ] ; then 
        NAME=$(uname -a)
    fi
fi

case "$NAME" in
    *bian* | *Ubuntu*)
        echo "DETECTED: Debian or similar."
        DIST='deb'
        ;;
    "Arch Linux")
        echo "DETECTED: Arch Linux."
        DIST='arch'
        ;;
    *Fedora* | *CentOS*)
        echo "DETECTED: Fedora or similar."
        DIST='fed'
        ;;
    *) 
        echo "No distro-specific aliases for $NAME."
        # DIST='' 
        exit 1
        ;;
esac

ln -vs $HOME/dotfiles/.aliases-$DIST $HOME/.aliases-dist

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

source .zshrc

exit 0
