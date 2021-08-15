#!/usr/bin/env sh

set -x
set -e

# sudo apt install zsh
# change shell edit 
# sudo vim /etc/passwd
# https://forums.aws.amazon.com/thread.jspa?threadID=83460
# setup add ssh-key with 
# ssh-keygen -t rsa -b 4096 -C "zhiyanfoo@gmail.com"
# scp 
# git clone https://github.com/zhiyanfoo/dotfiles

sudo apt update
sudo apt install neovim
sudo apt install fd-find
sudo ln -s $(which fdfind) /usr/local/bin/fd
sudo apt install ripgrep
sudo apt install cmake
sudo apt install gnupg2
sudo apt install fzf
sudo apt install wget
sudo apt install tig
sudo apt install python3-pip

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








