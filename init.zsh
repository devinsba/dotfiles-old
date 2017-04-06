#@IgnoreInspection BashAddShebang
HERE=${0:a:h}

export REPO_HOME=$HERE

for file in $HERE/lib/*.zsh; do source $file; done
for file in $HERE/common/*.zsh; do source $file; done
[ -d "$HERE/`uname`" ] && for file in $HERE/`uname`/*.zsh; do source $file; done

echo "${#INSTALLERS[@]} installers to run"
if [ ${#INSTALLERS[@]} -gt 0 ] ; then
    echo "  ${INSTALLERS[@]}"
    echo "OR"
    echo "  execute_installers"
fi
