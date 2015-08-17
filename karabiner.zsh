HERE=${0:a:h}

if [[ `uname` == 'Darwin' ]] ; then
  if [[ ! -a "$HOME/Library/Application Support/Karabiner/private.xml" ]] ; then
    ln -s "$HERE/osx/karabiner/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
  fi
fi
