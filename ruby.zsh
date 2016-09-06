[[ ! -s "$HOME/.rvm/scripts/rvm" ]] && curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && export PATH="$PATH:$HOME/.rvm/bin"

MY_RUBY_VERSION=2.3.1

[[ ! -f "$rvm_path/rubies/ruby-$MY_RUBY_VERSION/bin/ruby" ]] && rvm install $RUBY_VERSION
rvm use --default $MY_RUBY_VERSION

if find $rvm_path/gems/ruby-$MY_RUBY_VERSION/gems/bundler* -type d -depth 0 &> /dev/null ; then
    echo "gem: bundler already installed"
else
    gem install bundler
fi
[[ ! -f "$rvm_path/bin/exec_bundle" ]] && rvm wrapper ruby-$MY_RUBY_VERSION exec bundle
