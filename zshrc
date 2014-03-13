# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

ulimit -n 1024

export PATH="/usr/local/bin:/usr/local/heroku/bin:/usr/local/mysql/bin:/Users/liuenze/Work/apache-maven-3.1.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
PATH=$PATH:$HOME/bin
export EDITOR=vi
export M2_HOME=$HOME/Work/apache-maven-3.1.1
export M2=$M2_HOME/bin
export pg_home="/Users/liuenze/Work/pg"
alias log4a="sshpass -p 1qaz@WSX ssh enze.liu@192.168.8.172"
alias logbeta="sshpass -p user4beta ssh betauser@192.168.211.122 -p58422"
alias work="cd ~/Work/git"
alias l="pwd;ls -l"
alias la="pwd;ls -al"
alias mysql_start="sudo /usr/local/mysql/bin/mysqld_safe &!"
alias mysql_stop="sudo pkill -9 -f mysql "
alias stgp="grunt compress;grunt dpm-server;"
export JAVA_HOME=$(/usr/libexec/java_home)
alias pg_start="pg_ctl start -D $pg_home/data -l $pg_home/log.log"

alias pg_stop="pg_ctl stop -D $pg_home/data"
alias ta="tmux attach"
alias server="python -m SimpleHTTPServer"
#生成tags
alias tag="ctags -R "
alias vi="vim"

#默认后缀的处理
alias -s log=vi
alias -s lisp=vi
alias -s cpp=vi
alias -s c=vi
alias -s rb=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.bindir'):$PATH"
fi
