#@IgnoreInspection BashAddShebang

HERE=${0:a:h}

if [[ -d "/Applications/Karabiner.app" ]] ; then
    mkdir -p "$HOME/Library/Application Support/Karabiner"
    if [[ ! -L "$HOME/Library/Application Support/Karabiner/private.xml" ]] ; then
        ln -s "$HERE/karabiner/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
    fi
fi
