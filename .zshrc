setopt menucomplete

source .commonprofile

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

setopt INC_APPEND_HISTORY
export SAVEHIST=100000
export HISTFILE=/Users/zhiyan/.zsh_history

