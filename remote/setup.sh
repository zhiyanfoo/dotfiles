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
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install vagrant -y
sudo apt install 'llvm-12*' -y
sudo apt install 'clang' -y

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
GO111MODULE=on go get golang.org/x/tools/gopls@latest

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

# docker

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    -y


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
# run 
sudo groupadd docker
sudo usermod -aG docker $USER
# need to exit shell and reenter to run docker without sudo

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \
     sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt install virtualbox-6.1


# sudo apt install zsh
# change shell edit 
# sudo vim /etc/passwd
# https://forums.aws.amazon.com/thread.jspa?threadID=83460
