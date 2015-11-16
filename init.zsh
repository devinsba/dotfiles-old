HERE=${0:a:h}

source $HERE/java.zsh

for file in `find $HERE -name "*.zsh"`; do
  if [[ "$file" =~ ".*(bootstrap\.zsh|init\.zsh|java\.zsh)$" ]]; then
    :
  else
    source $file
  fi
done
