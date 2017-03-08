setopt menucomplete

source ~/.commonprofile
source ~/.functions

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
export SAVEHIST=100000
export HISTFILE=/Users/zhiyan/.zsh_history

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH=/Users/fzhiyan/Library/Haskell/bin:/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/fzhiyan/Library/Haskell/bin:/usr/local/sbin:/Users/fzhiyan/.rvm/bin:/Users/fzhiyan/src/BUILD-infrastructure/newproject
