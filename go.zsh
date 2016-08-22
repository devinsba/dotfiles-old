if [[ ! -d "$HOME/.gimme" ]] ; then
  mkdir -p ~/bin
  curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
  chmod +x ~/bin/gimme
fi

export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

function __after_gimme() {
  eval "$(gimme 1.7)"
}
