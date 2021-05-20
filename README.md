# My setup

* Run these commands 
```
mkdir ~/Repos
sudo dnf install -y tree git tmux vim
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
```

* Generate SSH key and add it to the ssh-agent.
```
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Then, add it to the Github settings page.

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

## VIM
* Add these to `~/.vimrc`
```
set number
set colorcolumn=80
imap jj <ESC>
```