#@IgnoreInspection BashAddShebang
function __devinsba_install_nvm() {
    (
        cd $ZSH_LIB_DIR
        git clone https://github.com/creationix/nvm.git &>/dev/null
        cd nvm
        git checkout `git describe --abbrev=0 --tags` 2>&1 | tail -n1
    )
    echo "Run this to use nvm in this shell: source $ZSH_LIB_DIR/nvm/nvm.sh"
}

function __devinsba_update_nvm() {
    (
        cd $ZSH_LIB_DIR/nvm
        git checkout master &>/dev/null
        git pull &>/dev/null
        git checkout `git describe --abbrev=0 --tags` 2>&1 | tail -n1
    )
    echo "Run this to use the new version in this shell: source $ZSH_LIB_DIR/nvm/nvm.sh"
}

if [[ ! -d "$ZSH_LIB_DIR/nvm" ]] ; then
    register_installer __devinsba_install_nvm
else
    source $ZSH_LIB_DIR/nvm/nvm.sh
fi

register_updater __devinsba_update_nvm

NODEVERSION=v6.9.1
function __devinsba_postinit_nodejs() {
    if [ -d $ZSH_LIB_DIR/nvm/versions/node/$NODEVERSION ] ; then
        nvm use $NODEVERSION
    else
        echo "Nodejs $NODEVERSION is not installed\n  nvm install it to get it configured for your shell"
    fi
}
register_postinit __devinsba_postinit_nodejs