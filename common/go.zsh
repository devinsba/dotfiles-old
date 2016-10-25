#@IgnoreInspection BashAddShebang
function __devinsba_install_gimme() {
    (
        cd $ZSH_LIB_DIR
        git clone git@github.com:travis-ci/gimme.git
        cd $ZSH_BIN_DIR
        ln -s $ZSH_LIB_DIR/gimme/gimme gimme
        gimme $GOVERSION &>/dev/null
    )
}

function __devinsba_update_gimme() {
    (
        cd $ZSH_LIB_DIR/gimme
        git pull
    )
    gimme $GOVERSION
    echo "Run this to change versions in the current shell: "'eval "$(gimme $GOVERSION)"'
}

function __devinsba_postinit_gimme() {
    if [ $(ls $HOME/.gimme/envs/ | grep $GOVERSION | wc -l) -gt "0" ] ; then
        eval "$(gimme $GOVERSION)"
    else
        echo "Run execute_updaters to get selected go version"
        source $HOME/.gimme/envs/latest.env
    fi
}

export GOVERSION=1.7.3
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

if [[ ! -d "$ZSH_LIB_DIR/gimme" ]] ; then
    register_installer __devinsba_install_gimme
else
    register_postinit __devinsba_postinit_gimme
fi

register_updater __devinsba_update_gimme