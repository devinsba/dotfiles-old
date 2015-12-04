if  [ -f /usr/libexec/java_home ]; then
  alias usejava7="export JAVA_HOME=`/usr/libexec/java_home --version 1.7`"
  alias usejava8="export JAVA_HOME=`/usr/libexec/java_home --version 1.8`"
  export JAVA_HOME=`/usr/libexec/java_home --version 1.8`
fi

if [[ `uname` == 'Linux' ]] ; then
  if [ -f /etc/debian_version ]; then
    export JAVA_HOME='readlink -f /usr/bin/java | sed "s:bin/java::"'
  fi
fi
