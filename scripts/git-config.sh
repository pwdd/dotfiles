#!/usr/bin/env bash

set -x

echo "Setting up git global config"

git config --global user.name "$1"
git config --global user.email $2
git config --global core.editor /usr/local/bin/nvim
git config --global core.excludesfile $HOME/.gitignore
git config --global credential.helper osxkeychain

cat $HOME/.gitconfig