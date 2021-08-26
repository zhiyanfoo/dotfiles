#!/usr/bin/env sh

set -x
set -e

# setup add ssh-key with 
# ssh-keygen -t rsa -b 4096 -C "zhiyanfoo@gmail.com"
# scp 
# git clone git@github.com:zhiyanfoo/dotfiles.git

sudo apt update -y
sudo apt install neovim -y
sudo apt install fd-find -y
sudo ln -s $(which fdfind) /usr/local/bin/fd
sudo apt install ripgrep -y
sudo apt install cmake -y
sudo apt install gnupg2 -y
sudo apt install fzf -y
sudo apt install wget -y
sudo apt install tig -y
sudo apt install python3-pip -y
sudo apt-get install bison -y


ln -s $HOME/dotfiles/remote/aliases $HOME/.aliases
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/remote/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/global_gitignore $HOME/.global_gitignore
ln -s $HOME/dotfiles/commonprofile $HOME/.commonprofile
mkdir -p $HOME/.config/nvim/
ln -s $HOME/dotfiles/snippets $HOME/.config/nvim/snippets
ln -s $HOME/dotfiles/remote/nvim_init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/zsh-completion $HOME/.zsh-completion
mkdir -p $HOME/.config/nvim/after
ln -s $HOME/dotfiles/ftplugin $HOME/.config/nvim/after/ftplugin

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
nvim -c 'PluginInstall'

pip3 install -U pynvim
pip3 install -U msgpack

pushd "$HOME/.vim/bundle/LanguageClient-neovim"
bash install.sh
popd

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.17
gvm use go1.17 --default

mkdir -p "${GOPATH}/src/github.com/cilium"
pushd "${GOPATH}/src/github.com/cilium"
git clone git@github.com:zhiyanfoo/cilium.git
pushd cilium 
git remote add upstream https://github.com/cilium/cilium.git
git fetch upstream
git merge upstream/master
git push origin master
popd
popd

# sudo apt install zsh
# change shell edit 
# sudo vim /etc/passwd
# https://forums.aws.amazon.com/thread.jspa?threadID=83460
