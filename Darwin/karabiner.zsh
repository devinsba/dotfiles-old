#@IgnoreInspection BashAddShebang
HERE=${0:a:h}

mkdir -p "$HOME/Library/Application Support/Karabiner"
if [[ ! -L "$HOME/Library/Application Support/Karabiner/private.xml" ]] ; then
    ln -s "$HERE/karabiner/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
fi
