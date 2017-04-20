function __devinsba_install_tfenv() {
  (
    cd $ZSH_LIB_DIR
    git clone https://github.com/kamatama41/tfenv.git
    cd $ZSH_BIN_DIR
    ln -s $ZSH_LIB_DIR/tfenv/bin/* .
  )
}
function __devinsba_install_terraform() {
  (
    tfenv install $TERRAFORM_VERSION
  )
}

export TERRAFORM_VERSION=0.8.8

if [[ ! -d "$ZSH_LIB_DIR/tfenv" ]] ; then
  register_installer __devinsba_install_tfenv
fi
if [[ ! -d "$ZSH_LIB_DIR/tfenv/versions/$TERRAFORM_VERSION" ]] ; then
  register_installer __devinsba_install_terraform
fi
