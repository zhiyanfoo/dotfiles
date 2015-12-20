setopt menucomplete

export PATH="/usr/local/bin:$PATH"
alias vim="vi --cmd \"let g:more_features_checker='yes'\""

source .aliases

# fzf installed line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# If not running interactively, do not do anything
# Start tmux at login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
