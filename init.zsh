HERE=${0:a:h}

source $HERE/java.zsh

for file in `find $HERE -name "*.zsh"`; do
  source $file
done
