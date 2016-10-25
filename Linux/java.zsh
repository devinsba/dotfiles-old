#@IgnoreInspection BashAddShebang
if [ -f /etc/debian_version ]; then
    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
fi
