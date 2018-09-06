[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  __git_complete g __git_main
  __git_complete gco _git_checkout
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $\n"

export CLICOLOR=1
export LSCOLORS=HxHxHxHxHxegedabagacad
export PATH="/Users/apint8/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/Users/apint8/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
export JUNIT_HOME="$HOME/java"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"
export PATH="/usr/local/opt/openssl/bin:$PATH"

alias ls='ls -Gh'
alias be="bundle exec"
# alias vim="vi"
alias vim="nvim"
alias c="clear"
alias chrome='open -a "Google Chrome"'
alias firefox='open -a Firefox'
alias startpg='pg_ctl -D /usr/local/var/postgres start'
alias stoppg='pg_ctl -D /usr/local/var/postgres stop'
alias starttomcat='brew services start tomcat'
alias stoptomcat='brew services stop tomcat'

alias gs='git status'
alias gp='git push'
alias gpr='git pull --rebase'
alias gpl='git pull'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gcv='git commit -v'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias grh='git reset --hard'
alias gco='git checkout'
alias gl='git lg -15'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gg='git grep --break --heading -n -i'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# eval "$(jenv init -)"
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
# alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

# alias jdk8="export JAVA_HOME=\"/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home\" && java -version"

