#@IgnoreInspection BashAddShebang
if [ -f /etc/debian_version ]; then
    export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
fi
