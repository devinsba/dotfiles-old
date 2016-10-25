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
function __devinsba_install_nodejs() {
    (
        source $ZSH_LIB_DIR/nvm/nvm.sh
        nvm install $NODEVERSION
        nvm alias default $NODEVERSION
    )
    echo "Run this to use your node version in this shell: nvm use $NODEVERSION"
}
function __devinsba_postinit_nodejs() {
    if [ -d $ZSH_LIB_DIR/nvm/versions/node/$NODEVERSION ] ; then
        nvm use $NODEVERSION
    else
        echo "Nodejs $NODEVERSION is not installed\n  nvm install it to get it configured for your shell"
    fi
}
function __devinsba_cleaner_nvm_nodejs() {
    rm -rf $HOME/.npm
    rm -rf $HOME/.node-gyp
    rm -rf $HOME/.nvm
}

# Use the full version string
NODEVERSION=v7.0.0

if [[ ! -d "$ZSH_LIB_DIR/nvm" ]] ; then
    register_installer __devinsba_install_nvm
fi
if [[ ! -d "$ZSH_LIB_DIR/nvm/versions/node/$NODEVERSION" ]] ; then
    register_installer __devinsba_install_nodejs
fi
if [[ -d "$ZSH_LIB_DIR/nvm" ]] ; then
    source $ZSH_LIB_DIR/nvm/nvm.sh
fi

register_updater __devinsba_update_nvm
register_postinit __devinsba_postinit_nodejs
register_cleaner __devinsba_cleaner_nvm_nodejs
