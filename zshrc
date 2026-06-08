[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

source ~/.commonprofile
source ~/.functions

fpath=(~/.zsh-completion $fpath)

# fzf
command -v fzf >/dev/null && eval "$(fzf --zsh)"
# BEGIN ANSIBLE MANAGED BLOCK
# Load homebrew shell variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Load python shims
eval "$(pyenv init -)"

# Load ruby shims
eval "$(rbenv init -)"

# Load direnv hook
eval "$(direnv hook zsh)"

# Load git-dd completions for zsh
autoload -Uz _git_dd

# Prefer GNU binaries to Macintosh binaries.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Add datadog devtools binaries to the PATH
export PATH="$HOME/dd/devtools/bin:$PATH"

# Point GOPATH to our go sources
export GOPATH="$HOME/go"

# Add binaries that are go install-ed to PATH
export PATH="$GOPATH/bin:$PATH"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="$HOME/dd"

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
# Configure Go to pull go.ddbuild.io packages.
# GOPRIVATE must stay unset: it forces matching modules (github.com/DataDog/*)
# off GOPROXY and into direct git, which clones the dd-source monorepo and hangs.
# An empty value is a no-op (Go falls back to its env file); use `go env -u GOPRIVATE`.
export GONOSUMDB=github.com/DataDog,go.ddbuild.io
export GOPROXY="https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/testing/@current/"
# END ANSIBLE MANAGED BLOCK

# Initialize zsh completion (must run after fpath additions from brew, etc.)
autoload -Uz compinit && compinit

PROMPT='> '
source "$HOME/.config/datadog/config.sh"

# BEGIN SCFW MANAGED BLOCK
alias npm="scfw run npm"
alias pip="scfw run pip"
alias poetry="scfw run poetry"
export SCFW_DD_AGENT_LOG_PORT="10365"
export SCFW_DD_LOG_LEVEL="ALLOW"
export SCFW_HOME="/Users/zhiyan.foo/.scfw"
# END SCFW MANAGED BLOCK

alias vim="nvim"

eval "$(dd-gitsign load-key)"
