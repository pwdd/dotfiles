#!/bin/bash
dir=~/dotfiles
olddir=~/dotfiles_old
nviminit=init.vim
files="bash_profile bashrc gitconfig gitignore ideavimrc tmux.conf"

mkdir -p ~/.config/nvim
mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file ~/dotfiles_old/
	ln -s $dir/$file ~/.$file
done

ln -s $dir/$nviminit ~/.config/nvim/init.vim

