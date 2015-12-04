if [[ ! -z $NOT_AT_WORK ]] ; then
  if [[ -z $WORK_REPO ]] ; then
    echo "Set the work repo with the WORK_REPO envar in .zshrc.local"
  fi
fi
