set -x
# export PATH=$PATH:$DOTDIR/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin

# check if were on darwin
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

set +x
