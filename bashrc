[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 }

export PS1="\[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "

export CLICOLOR=1
export LSCOLORS=HxHxHxHxHxegedabagacad
export PATH="/Users/aina/.local/bin:/usr/local/bin:$PATH"
export JUNIT_HOME="$HOME/java"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"

alias ls='ls -Gh'
alias be="bundle exec"
alias vim="vi"
alias c="clear"
alias chrome='open -a "Google Chrome"'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# added by travis gem
[ -f /Users/aina/.travis/travis.sh ] && source /Users/aina/.travis/travis.sh

