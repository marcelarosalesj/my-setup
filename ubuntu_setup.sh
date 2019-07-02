#!/bin/bash

install_system_packages(){
    # System packages
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y git tmux vim tree 
}

config_tmux(){
    echo "Configuring tmux"
    sudo apt install -y tmux
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
}

config_git(){
    echo "Configuring git"
    set -x
    sudo apt install -y git
    git config --global user.name "Marcela Rosales"
    git config --global user.email marcelarosalesj@gmail.com
    git config --global core.editor "vim"
    set +x
}

config_vim(){
    set -x
    echo "Configuring vim"
    sudo apt install -y vim ||
    # Use this vimrc
    mkdir -p $HOME/.vim
    cp vimrc $HOME/.vim
    # Install pathogen
    if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
        mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
    # Colorscheme
    set +x

}

config_python(){
    echo "Configuring python"
    # install pip
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python3 get-pip.py

    # virtualenvironments
    sudo pip install virtualenv virtualenvwrapper
    sudo rm -rf get-pip.py ~/.cache/pip
    echo "
    # virtualenv and virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh" >> $HOME/.bashrc
    source $HOME/.bashrc
}

config_docker(){
    echo "Configuring docker"
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo gpasswd -a $USER docker
    newgrp docker
}

print_usage(){
    echo "$package - setup my personal environment"
    echo " "
    echo "$package [options]"
    echo " "
    echo "options:"
    echo "-h, --help                show brief help"
    echo "-a, --all                 do the complete setup"
    echo "--vim                     vim"
    echo "--tmux                    tmux"
    echo "--git                     git"
    echo "--python                  python"
    echo "--bash                    bash"
    echo "--system                  system"
    echo "--docker                  docker"

}

while [ "$1" != "" ]; do
    case "$1" in
        -h|--help)
            shift
            print_usage
            exit 0
            ;;
        -a|--all)
            shift
            echo "Setup the complete environment"
            install_system_packages
            config_tmux
            config_vim
            config_git
            config_python
            config_bash
            ;;
        --system)
            shift
            echo "Install packages"
            install_system_packages
            ;;
        --tmux)
            shift
            echo "Config tmux"
            config_tmux
            ;;
        --vim)
            shift
            echo "Config vim"
            config_vim
            ;;
        --git)
            shift
            echo "Config git"
            config_git
            ;;
        --python)
            shift
            echo "Config python"
            config_python
            ;;
        --bash)
            shift
            echo "Config bash"
            config_bash
            ;;
        --docker)
            shift
            echo "Config docker"
            config_docker
            ;;
        *)
            shift
            print_usage
            exit 1
            ;;
        esac
done
