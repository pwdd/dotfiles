#!/bin/bash

###############################
# Creates symlinks for dotfiles
###############################

######### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
files="bash_profile bashrc gitconfig gitignore lein tmux.conf vim viminfo vimrc"

######### 

# create dotfiles_old in homedir
echo "Creating $olddir for backing up any existing dotfiles in~"
mkdir -p $olddir
echo "...done"

# change to dotfiles dir
echo "Changing into $dir"
cd $dir
echo "...done"

# move existing dotfiles in ~ to _old and create symlinks
for file in $files; do
	echo "Moving existing dotfiles to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home dir"
	ln -s $dir/$file ~/.$file
done
