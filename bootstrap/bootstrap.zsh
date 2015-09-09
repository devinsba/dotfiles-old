#/usr/bin/env zsh

# Install Antigen
mkdir -p $HOME/.zshbin
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $HOME/.zshbin/antigen.zsh
source $HOME/.zshbin/antigen.zsh

# Install zshrc file
antigen bundle devinsba/dotfiles
mv $HOME/.zshrc $HOME/.zshrc.old
ln -s $HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-devinsba-SLASH-dotfiles.git/bootstrap/zshrc $HOME/.zshrc
