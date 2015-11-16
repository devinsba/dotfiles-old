if [[ ! -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] ; then
  (
    cd $HOME
    curl -s http://get.sdkman.io | sed -e '/Attempt update of bash profiles.../,$d' | bash
  )
fi
