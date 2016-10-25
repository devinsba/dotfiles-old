function __devinsba_install_sdkman() {
    (
        cd $HOME
        curl -s http://get.sdkman.io | sed -e '/Attempt update of bash profiles.../,$d' | bash
    )
}

function __devinsba_update_sdkman() {
    sdk selfupdate force
    source "$HOME/.sdkman/bin/sdkman-init.sh"
}

function __devinsba_postinit_sdkman() {
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}


if [[ ! -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] ; then
    register_installer __devinsba_install_sdkman
else
    register_postinit __devinsba_postinit_sdkman
fi

register_updater __devinsba_update_sdkman
