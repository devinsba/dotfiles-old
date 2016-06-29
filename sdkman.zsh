if [[ ! -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] ; then
  (
    cd $HOME
    curl -s http://get.sdkman.io | sed -e '/Attempt update of bash profiles.../,$d' | bash
  )
fi

function __after_sdkman() {
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}
