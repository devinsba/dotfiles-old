if [[ ! -d "$HOME/.gimme" ]] ; then
  mkdir -p ~/bin
  curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
  chmod +x ~/bin/gimme
fi

eval "$(gimme 1.7)"
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
