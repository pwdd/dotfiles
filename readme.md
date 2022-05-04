# dotfiles - WIP

- Setup gitconfig with `./scripts/git-config.sh <username> <email>`
- Install homebrew `./scripts/install-homebrew.sh`
- Install homebrew managed deps `./scripts/brew.sh`
- Install coursier managed deps `./scripts/coursier.sh`
- Install language servers `./scripts/language_servers.sh`
- Install oh-my-zsh `./scripts/oh-my-zsh.sh`
- Update iTerm to use one of the themes (`*.itermcolors`).
- Update the iTerm profile to use a [nerd font](https://github.com/ryanoasis/nerd-fonts) so that devicons
    work properly. Currently, `scripts/brew.sh` installs Hack and Jetbrains Mono
- Symlink oh-my-zsh (aliases): `stow oh-my-zsh`
- Symlink tmux config: `stow tmux`
- Symlink zsh: `stow zsh`
- Symlink neovim configs: `stow nvim`

