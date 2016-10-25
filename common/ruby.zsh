#@IgnoreInspection BashAddShebang
function __devinsba_install_rvm() {
    (
        curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
        echo 'rvm_silence_path_mismatch_check_flag=1' >> ~/.rvmrc
    )
    echo "Run this to use nvm in this shell: source $HOME/.rvm/scripts/rvm"
}

function __devinsba_update_rvm() {
    (
        rvm get head
    )
    echo "Run this to use the new version in this shell: source $HOME/.rvm/scripts/rvm"
}
function __devinsba_install_ruby() {
    (
        source $HOME/.rvm/scripts/rvm
        rvm install --default $RUBY_VERSION
    )
    echo "Run this to use your ruby version: rvn use $RUBYVERSION"
}
function __devinsba_postinit_ruby() {
    if [ -d $ZSH_LIB_DIR/nvm/versions/node/$NODEVERSION ] ; then
        rvm use --default $RUBYVERSION
    else
        echo "Ruby $RUBYVERSION is not installed\n  rvm install it to get it configured for your shell"
    fi
}

# Use the full version here
RUBYVERSION=ruby-2.3.1

if [[ ! -f "$HOME/.rvm/scripts/rvm" ]] ; then
    register_installer __devinsba_install_rvm
fi
if [[ ! -d "$HOME/.rvm/rubies/$RUBYVERSION" ]] ; then
    register_installer __devinsba_install_ruby
fi
if [[ -f "$HOME/.rvm/scripts/rvm" ]] ; then
    source $HOME/.rvm/scripts/rvm
fi

register_updater __devinsba_update_rvm
register_postinit __devinsba_postinit_ruby

#command='find $rvm_path/gems/ruby-$MY_RUBY_VERSION/gems/bundler* -maxdepth 0 -type d &> /dev/null'
#if [[ $(uname) == "Darwin" ]] ; then
#  command='find $rvm_path/gems/ruby-$MY_RUBY_VERSION/gems/bundler* -depth 0 -type d &> /dev/null'
#fi
#
#if zsh -c "$command" ; then
#    echo "gem: bundler already installed"
#else
#    gem install bundler
#fi
#[[ ! -f "$rvm_path/bin/exec_bundler" ]] && rvm wrapper ruby-$MY_RUBY_VERSION exec bundler
