#!/usr/bin/env bash

brew update
brew upgrade

brew cask install java
brew tap caskroom/versions
brew cask install java8

brew install bash-completion
brew install git
brew install git-quick-stats
brew install gnupg
brew install gnupg2
brew install leiningen
brew install node
brew install openssl
brew install python3
brew install rbenv
brew install reattach-to-user-namespace
brew install ruby-build
brew install sbt
brew install scala
brew install scalastyle
brew install tmux
brew install tree
brew install macvim --with-override-system-vi

brew cleanup
