if [[ ! -d "$HOME/.nvm" ]] ; then
  (
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
  )
else
  (
    cd $HOME/.nvm
    git checkout `git describe --abbrev=0 --tags`
  )
fi

. ~/.nvm/nvm.sh
