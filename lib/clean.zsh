#@IgnoreInspection BashAddShebang
CLEANERS=()

function register_cleaner() {
    CLEANERS+=($1)
}

function __zsh_self_destruct() {
    rm -rf $HOME/.antigen
    rm -rf $HOME/.zshtools
    rm $HOME/.zshrc
    [ -f $HOME/.zshrc.old ] && mv $HOME/.zshrc.old $HOME/.zshrc
}

function zsh_self_destruct() {
    echo "THIS DESTROYS YOUR CURRENT ZSH ENV! Are you really sure? [y/N]"
    read response
    case $response in
        [yY][eE][sS]|[yY])
            ;;
        *)
            echo "Not self destructing"
            return
            ;;
    esac

    for func in "${CLEANERS[@]}"
    do
        $func
    done

    __zsh_self_destruct
}