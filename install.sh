#! /usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s .gitconfig $HOME_DIR
ln -s .vim $HOME_DIR
ln -s .vimrc $HOME_DIR
ln -s .conkyrc $HOME_DIR

if [ -z $BASH_IT ]; then
	echo "bash-it not installed; bash-it customizations not installed.";
	echo "Ensure that .bash_profile is invoked during bash startup.";
else
	cp -R $DOTFILES_DIR/themes/* $BASH_IT/themes
	cp -R $DOTFILES_DIR/custom/* $BASH_IT/custom
	echo "Remember to set \$BASH_IT_THEME in .bash_profile";
fi
