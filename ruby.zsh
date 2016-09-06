[[ ! -s "$HOME/.rvm/scripts/rvm" ]] && curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && export PATH="$PATH:$HOME/.rvm/bin"

RUBY_VERSION=2.3.1

[[ ! -f "$rvm_path/rubies/ruby-$RUBY_VERSION/bin/ruby" ]] && rvm install $RUBY_VERSION
rvm use --default $RUBY_VERSION

[[ ! `find $rvm_path/gems/ruby-$RUBY_VERSION/gems/bundler* -type d -quit &> /dev/null` ]] && gem install bundler
[[ ! -f "$rvm_path/bin/exec_bundle" ]] && rvm wrapper ruby-$RUBY_VERSION exec bundle
