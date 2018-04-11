[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " ["$1"]" }'
}

parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}


export PS1="\[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\$(parse_svn_branch)\[\033[00m\] $ "

export CLICOLOR=1
export LSCOLORS=HxHxHxHxHxegedabagacad
export ANT_HOME="/Users/aina/apache-ant-1.8.4"
export PATH="/Users/aina/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$PATH:$ANT_HOME/bin"
export JUNIT_HOME="$HOME/java"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"

alias ls='ls -Gh'
alias be="bundle exec"
alias vim="vi"
alias c="clear"
alias chrome='open -a "Google Chrome"'
alias startpg='pg_ctl -D /usr/local/var/postgres start'
alias stoppg='pg_ctl -D /usr/local/var/postgres stop'
alias starttomcat='brew services start tomcat'
alias stoptomcat='brew services stop tomcat'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# eval "$(jenv init -)"
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
# alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

alias jdk7="export JAVA_HOME=\"/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home\" && java -version"
alias jdk8="export JAVA_HOME=\"/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home\" && java -version"

# added by travis gem
[ -f /Users/aina/.travis/travis.sh ] && source /Users/aina/.travis/travis.sh

