# https://github.com/kamatama41/tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

function tf() {
  terraform $@
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
}

# https://github.com/cunymatthieu/tgenv
export PATH="$HOME/.tgenv/bin:$PATH"

function tg() {
  terragrunt $@
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
  echo -e "\a"
}
