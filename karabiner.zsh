HERE=${0:a:h}

if [ "$(uname)" == "Darwin" ]; then
  cp "$HERE/osx/karabiner/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
fi
