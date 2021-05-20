# After installing bash-git-prompt

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

export GIT_PROMPT_THEME=Evermeet_Ubuntu

# Alias
alias vi="vim"
alias repos="cd ~/Repos"
alias l="ls -lah"