#! /usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SLR_DIR=$(python -c "import os.path; print os.path.relpath('./', os.path.expanduser('~'))")

# Symlink dotfiles.
files=".gitconfig .vim .vimrc .tmux.conf .conkyrc .bash"
for file in $files; do
	unlink $HOME/$file 2> /dev/null
	ln -sf $SLR_DIR/$file $HOME/$file
done
