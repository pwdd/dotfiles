#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
nviminit=init.vim
files="zshrc gitignore ideavimrc tmux.conf"

mkdir -p ~/.config/nvim
mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file $olddir/
	ln -s $dir/$file ~/.$file
done

mv ~/.oh-my-zsh/custom/aliases.zsh $olddir/
ln -s $dir/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

mv ~/.config/nvim/init.vim $olddir/
ln -s $dir/$nviminit ~/.config/nvim/init.vim

