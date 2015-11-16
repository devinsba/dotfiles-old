HERE=${0:a:h}

source $HERE/java.zsh

for file in `find $HERE -name "*.zsh"`; do
  if [[ $file =~ ".*init\.zsh$" -o $file =~ ".*init\.zsh$" ]]; then
    echo "$file already loaded"
  else
    source $file
  fi
done
