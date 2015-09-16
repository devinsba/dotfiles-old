HERE=${0:a:h}

if [[ `uname` == 'Darwin' ]] ; then
  mkdir -p "$HOME/Library/Application Support/Karabiner"
  if [[ ! -a "$HOME/Library/Application Support/Karabiner/private.xml" ]] ; then
    ln -s "$HERE/osx/karabiner/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
  fi
fi
