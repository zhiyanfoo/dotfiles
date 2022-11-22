# zmodload zsh/zprof
# google-cloud-sdk brew caveat
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# BEGIN ANSIBLE MANAGED BLOCK
# Add homebrew binaries to the path.
export PATH="/opt/homebrew/bin:${PATH?}"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Load python shims
# eval "$(pyenv init -)"

# Load ruby shims
# eval "$(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"

# Add AWS CLI to PATH
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"

# Add datadog devtools binaries to the PATH
export PATH="${HOME?}/dd/devtools/bin:${PATH?}"

# Point GOPATH to our go sources
export GOPATH="${HOME?}/go"

# Add binaries that are go install-ed to PATH
export PATH="${GOPATH?}/bin:${PATH?}"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="${HOME?}/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm switch from storing objects in kubernetes configmaps to
# secrets by default, but we still use the old default.
export HELM_DRIVER=configmap

# Go 1.16+ sets GO111MODULE to off by default with the intention to
# remove it in Go 1.18, which breaks projects using the dep tool.
# https://blog.golang.org/go116-module-changes
export GO111MODULE=auto
export GOPRIVATE=github.com/DataDog
# END ANSIBLE MANAGED BLOCK

source ~/.functions
source ~/.commonprofile

eval $(/opt/homebrew/bin/brew shellenv)

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -2

export FZF_DEFAULT_COMMAND=$'fd --type f --exclude \'*.pyc\' --exclude node_modules'

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"


# zsh autocomplete uses the variable fpath
# add custom to ~/.zsh-completion
# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh-completion $fpath) 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

zstyle ':completion:*' menu select=2
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
() {
  setopt extendedglob local_options
  if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
    touch .zcompdump
  else
    compinit -C
  fi
}
# End of lines added by compinstall

autoload bashcompinit
bashcompinit

source "/opt/zen/zen_completion"
source "/opt/zen2/zen2_completion"
source $HOME/.zsh-completion/_az

export VISUAL=nvim
export EDITOR="$VISUAL"

# source $HOME/.rvm/scripts/rvm
alias loadrvm='[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source $HOME/.secrets/secrets
export PROMPT="%F{cyan}>%f "

export NVIM_LISPWORDS="$HOME/.config/nvimlispwords.lua"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

# 2x ctrl-d to exit ...
export IGNOREEOF=1

# bash like ctrl-d wrapper for IGNOREEOF
setopt ignore_eof
function bash-ctrl-d() {
  if [[ $CURSOR == 0 && -z $BUFFER ]]
  then
    [[ -z $IGNOREEOF || $IGNOREEOF == 0 ]] && exit
    if [[ "$LASTWIDGET" == "bash-ctrl-d" ]]
    then
      (( --__BASH_IGNORE_EOF <= 0 )) && exit
    else
      (( __BASH_IGNORE_EOF = IGNOREEOF ))
    fi
  fi
}
zle -N bash-ctrl-d
bindkey "^d" bash-ctrl-d
bindkey -e

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'

# changed form echo $(brew --prefix) to speed up
source /opt/homebrew/etc/profile.d/z.sh

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

for file in "$HOME"/.config/company/*_rc
do
    source $file
done

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# https://peterlyons.com/problog/2018/01/zsh-lazy-loading/
##### nvm (node version manager) #####
# placeholder nvm shell function
# On first use, it will set nvm up properly which will replace the `nvm`
# shell function with the real one
#replaces 
# --- 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ---

nvm() {
    NVM_DIR="$HOME/.nvm"
    export NVM_DIR
    # shellcheck disable=SC1090
    source "${NVM_DIR}/nvm.sh"
    if [[ -e ~/.nvm/alias/default ]]; then
      PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    fi
    # invoke the real nvm function now
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm "$@"
}

# zprof
