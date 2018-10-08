source ~/.commonprofile
source ~/.functions

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -2
export FZF_DEFAULT_COMMAND=$'fd --type f --exclude \'*.pyc\''

export TERM="screen-256color"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

VENV_WRAPPER=/usr/local/bin/virtualenvwrapper_lazy.sh

plugins=(git brew python virtualenvwrapper)

if [ -f "$VENV_WRAPPER" ]
then
    source $VENV_WRAPPER
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/Courses/nand2tetris2/tools"
export PATH="$PATH:/Users/zhiyan/tools/scmindent"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh-completion $fpath) 

zstyle ':completion:*' menu select=2
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/Users/zhiyan/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload bashcompinit
bashcompinit

source /Users/zhiyan/tools/zen/completions/zen_bash_completion
source /Users/zhiyan/tools/zen/completions/zen2_bash_completion

export PATH="/Users/zhiyan/.local/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# GOT IT SPECIFIC
export PUSHER_CHANNEL_NAMESPACE="zhiyanfoo"
export HTTPLIB_CA_CERTS_PATH="$HOME/.config/cacert.pem"
# END GOT IT

source ~/.rvm/scripts/rvm
source ~/.secrets/secrets.sh
