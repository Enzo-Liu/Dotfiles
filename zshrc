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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate ruby autojump)
ZSH_CUSTOM=$HOME/Dotfiles/zsh/custom

source $ZSH/oh-my-zsh.sh

# User configuration

ulimit -n 1024

export EDITOR=vim
alias work="cd $HOME/work/"
alias ls="ls -h --color"
alias l="pwd;ls -lh"
alias la="pwd;ls -alh"
alias ta="tmux attach"
alias server="python -m SimpleHTTPServer"
#生成tags
alias tag="ctags -R --tag-relative=yes -e -L"
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

checkout(){
  git fetch
  git checkout $1
  git pull origin $1
}
alias co=checkout
alias p='ggpull && ggpush'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
alias rswank="ssh -N -f -L 4005:127.0.0.1:4005 vps"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=220'
export ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi

source $HOME/bin/init


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f "/Users/lez/.ghcup/env" ] && source "/Users/lez/.ghcup/env" # ghcup-env
if [ -e /Users/lez/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/lez/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(direnv hook zsh)"
