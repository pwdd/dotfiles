#!/bin/bash
dir=~/dotfiles
olddir=~/dotfiles_old
files="zshrc gitconfig gitignore ideavimrc tmux.conf"

mkdir -p ~/.config/nvim
mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file ~/$olddir/
	ln -s $dir/$file ~/.$file
done

mv ~/aliases.zsh ~/$olddir/
ln -s $dir/aliases.zsh ~/aliases.zsh


