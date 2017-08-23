#!/usr/bin/env bash

sudo -v
sudo chsh -s /bin/zsh $USER

# Install Antigen
mkdir -p $HOME/.antigen
mkdir -p $HOME/.zshtools/lib/antigen
mkdir -p $HOME/.zshtools/bin
git clone https://github.com/zsh-users/antigen.git $HOME/.zshtools/lib/antigen
source $HOME/.zshtools/lib/antigen/antigen.zsh

# Install console fonts
git clone git@github.com:powerline/fonts.git $HOME/.zshtools/lib/fonts
$HOME/.zshtools/lib/fonts/install.sh

# Install zshrc file
antigen bundle devinsba/dotfiles
if [[ -f $HOME/.zshrc ]]; then
    if [[ ! -L $HOME/.zshrc ]]; then
        mv $HOME/.zshrc $HOME/.zshrc.old
    else
        mv $HOME/.zshrc $HOME/.zshrc.sym
    fi
fi
ln -s $HOME/.antigen/bundles/devinsba/dotfiles/bootstrap/zshrc $HOME/.zshrc
(
    cd $HOME/.antigen/bundles/devinsba/dotfiles/
    git remote set-url origin git@github.com:devinsba/dotfiles.git
)

echo "Executing installers for you"
execute_installers
source $HOME/.zshrc

echo "Open a new shell for all your antigen powered goodness"
rm -r ~/.zcompdump
