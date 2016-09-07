[[ ! -s "$HOME/.rvm/scripts/rvm" ]] && curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles && echo 'rvm_silence_path_mismatch_check_flag=1' >> ~/.rvmrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

MY_RUBY_VERSION=2.3.1

[[ ! -f "$rvm_path/rubies/ruby-$MY_RUBY_VERSION/bin/ruby" ]] && rvm install ruby-$RUBY_VERSION
rvm use --default ruby-$MY_RUBY_VERSION

command='find $rvm_path/gems/ruby-$MY_RUBY_VERSION/gems/bundler* -maxdepth 0 -type d &> /dev/null'
if [[ $(uname) == "Darwin" ]] ; then
  command='find $rvm_path/gems/ruby-$MY_RUBY_VERSION/gems/bundler* -depth 0 -type d &> /dev/null'
fi

if $(command) ; then
    echo "gem: bundler already installed"
else
    gem install bundler
fi
[[ ! -f "$rvm_path/bin/exec_bundler" ]] && rvm wrapper ruby-$MY_RUBY_VERSION exec bundler

function __after_rvm() {
  export PATH="$PATH:$HOME/.rvm/bin"
  rvm use --default ruby-$MY_RUBY_VERSION
}
