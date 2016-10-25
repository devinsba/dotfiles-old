#!/usr/bin/env bash

sudo -v
sudo chsh -s /bin/zsh

# Install Antigen
mkdir -p $HOME/.zshtools/lib
mkdir -p $HOME/.zshtools/bin
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $HOME/.zshtools/lib/antigen/antigen.zsh
ln -l $HOME/.zshtools/lib/antigen/antigen.zsh $HOME/.zshtools/bin/antigen.zsh
source $HOME/.zshtools/bin/antigen.zsh

# Install zshrc file
antigen bundle devinsba/dotfiles
if [[ -f $HOME/.zshrc ]]; then
    if [[ ! -L $HOME/.zshrc ]]; then
        mv $HOME/.zshrc $HOME/.zshrc.old
    fi
fi
ln -s $HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-devinsba-SLASH-dotfiles.git/bootstrap/zshrc $HOME/.zshrc
