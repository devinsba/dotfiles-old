function zsh_self_destruct() {
    rm -rf $HOME/.antigen
    rm -rf $HOME/.zcompdump*
    rm -rf $HOME/.zshtools
    rm $HOME/.zshrc
    [ -f $HOME/.zshrc.old ] && mv $HOME/.zshrc.old $HOME/.zshrc
}