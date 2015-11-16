HERE=${0:a:h}

source $HERE/java.zsh

for file in `find $HERE -name "*.zsh"`; do
  if [[ "$file" =~ ".*(init\.zsh|java\.zsh)$" ]]; then
    echo "$file already loaded"
  else
    echo "Loading $file"
    source $file
  fi
done
