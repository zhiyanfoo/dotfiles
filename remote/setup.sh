#!/usr/bin/env bash

set -x
set -e

# setup add ssh-key with 
# ssh-keygen -t rsa -b 4096 -C "zhiyanfoo@gmail.com"
# scp 
# git clone git@github.com:zhiyanfoo/dotfiles.git

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


# sudo apt install zsh -y
# change shell edit 
# sudo vim /etc/passwd
# https://forums.aws.amazon.com/thread.jspa?threadID=83460
