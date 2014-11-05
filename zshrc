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
plugins=(git textmate ruby autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

ulimit -n 1024

if [ "$(uname -s)" = "Darwin" ]
then
  export USER_FOLDER=$HOME
else
  export USER_FOLDER=$HOME/host
fi

export PATH="/usr/local/bin:/usr/local/heroku/bin:/usr/local/mysql/bin:/usr/local/jdk1.7.0_51/bin:$USER_FOLDER/Work/apache-maven-3.1.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
PATH=$PATH:$USER_FOLDER/bin
export EDITOR=vi
export M2_HOME=$USER_FOLDER/Work/apache-maven-3.1.1
export M2=$M2_HOME/bin
alias log4a="sshpass -p 1qaz@WSX ssh enze.liu@192.168.8.172"
alias logbeta="sshpass -p user4beta ssh betauser@192.168.211.122 -p58422"
#alias ubuntu="sshpass -p 1qaz@WSX ssh liuenze@192.168.32.94"
alias ubuntu="sshpass -p vagrant ssh vagrant@10.211.55.4"
alias work="cd $USER_FOLDER/Work/git"
alias l="pwd;ls -l"
alias la="pwd;ls -al"
alias stgp="grunt compress;grunt dpm-server;"
alias ta="tmux attach"
alias server="python -m SimpleHTTPServer"
#生成tags
alias tag="ctags -R --tag-relative=yes -e -L"
alias vi="vim"
alias e="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -a=''"
alias ge="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n"
alias es="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"

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

checkout(){
  git fetch
  git checkout $1
  git pull origin $1
}
alias co=checkout
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

if [ "$(uname -s)" = "Darwin" ]
then
  if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.bindir'):$PATH"
  fi
else
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM ]]
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
alias cask="brew cask"
