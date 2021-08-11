source ~/.commonprofile
source ~/.functions

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -2

export FZF_DEFAULT_COMMAND=$'fd --type f --exclude \'*.pyc\' --exclude node_modules'

export TERM="screen-256color"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
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
compinit
# End of lines added by compinstall

autoload bashcompinit
bashcompinit

source $HOME/tools/zen/completions/zen_bash_completion
source $HOME/tools/zen/completions/zen2_bash_completion
source $HOME/.zsh-completion/_az

export VISUAL=nvim
export EDITOR="$VISUAL"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

for f in $HOME/.config/company/*_rc;  do source $f; done
source ~/.rvm/scripts/rvm
source ~/.secrets/secrets
export PROMPT="🔥 "
export NVIM_LISPWORDS="$HOME/.config/nvimlispwords.lua"

export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
DOCKER_BUILDKIT=1

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

[[ -s "/Users/zhiyan/.gvm/scripts/gvm" ]] && source "/Users/zhiyan/.gvm/scripts/gvm"

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'
