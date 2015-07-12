#! /usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SLR_DIR=$(python -c "import os.path; print os.path.relpath('./', os.path.expanduser('~'))")

# Symlink dotfiles.
files=".gitconfig .vim .vimrc .tmux.conf .conkyrc"
for file in $files; do
	unlink $HOME/$file 2> /dev/null
	ln -sf $SLR_DIR/$file $HOME/$file
done

if [ -z $BASH_IT ]; then
	echo "bash-it not installed; bash-it customizations not installed.";
	echo "Ensure that .bash_profile is invoked during bash startup.";
else
	ln -sf $SLR_DIR/themes/* $BASH_IT/themes
	ln -sf $SLR_DIR/custom/* $BASH_IT/custom
	echo "Remember to set \$BASH_IT_THEME in .bash_profile";
fi
