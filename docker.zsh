if [ -z $DOCKER_BETA ] ; then
  if (( $+commands[docker-machine] )) ; then
  	eval $(docker-machine env default)
  fi
fi
