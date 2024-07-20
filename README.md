# My setup

* Run these commands 
```
# Fedora
mkdir ~/Repos
sudo dnf install -y tree git tmux vim

# Ubuntu
mkdir ~/Repos
sudo apt install -y tree git tmux vim net-tools curl htop
```

## Tmux

* Install [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
```
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```
Remember to override by modifying `.tmux/.tmux.conf.local`

## Github
* Global configuration
```
git config --global user.name "Marcela Rosales"
git config --global user.email marcelarosalesj@gmail.com
git config --global core.editor "vim"

#
git config --global alias.tree 'log --oneline --graph --decorate --all'
git config --global alias.tree
git tree
```

* Generate SSH key and add it to the ssh-agent.
```
ssh-keygen -t ed25519 -C "marcelarosalesj@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Then, add it to the Github settings page.

## VIM
* Add these to `~/.vimrc`
```
set number
set colorcolumn=80
inoremap jj <ESC>
filetype plugin indent on
colorscheme ron
nnoremap <F3> :set hlsearch!<CR>
```

## Bash config
* Install [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
```
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
```

* Add these to `~/.bashrc`
```
# Custom for Marcela

# bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi
export GIT_PROMPT_THEME=Evermeet_Ubuntu

# Alias
alias vi="vim"
alias repos="cd ~/Repos"
alias l="ls -lah"
```
## Docker

* Follow [this guide for Fedora](https://docs.docker.com/engine/install/fedora/)
```
# Fedora
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo docker run hello-world

# Ubuntu

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y # Ubuntu

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y 
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
 
 
# Linux Post-steps
 
 sudo groupadd docker
 sudo usermod -aG docker $USER
 newgrp docker 
 docker run hello-world
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
 
 
# Linux Post-steps
 
 sudo groupadd docker
 sudo usermod -aG docker $USER
 newgrp docker 
 docker run hello-world
```
* Consider the (post-installation steps)[https://docs.docker.com/engine/install/linux-postinstall/]

# Utilities

- https://github.com/sharkdp/fd
```
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```
- https://github.com/BurntSushi/ripgrep
```
sudo apt-get install ripgrep
```
