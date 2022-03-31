#!/usr/bin/env bash

brew update
brew upgrade

brew untap AdoptOpenJDK/openjdk
brew install --cask temurin
brew tap homebrew/cask-versions
brew install --cask temurin8
brew install --cask temurin11

brew install bash-completion
brew install git
brew install git-quick-stats
brew install gnupg
brew install gnupg2
brew install node
brew install openssl
brew install python3
brew install reattach-to-user-namespace
brew install sbt
brew install scala
brew install tmux
brew install tree
brew install neovim
brew install scalacenter/bloop/bloop
brew install coursier/formulas/coursier
brew install --cask iterm2

brew cleanup
