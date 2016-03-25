if [[ ! -d "$HOME/.nvm" ]] ; then
  (
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
  )
else
  (
    echo "Updating nvm.."
    cd $HOME/.nvm
    git checkout master &> /dev/null
    git pull &> /dev/null
    git checkout `git describe --abbrev=0 --tags` | tail -n1
  )
fi

. ~/.nvm/nvm.sh
