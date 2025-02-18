echo 'sourcing .zprofile!'
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=/opt/nvim-macos-arm64/bin/nvim
# TODO: use a better path
export LS_COLORS="$(/Users/rdn/Desktop/GitHub/rdnajac/.files/etc/LS_PY)"

# add executables to PATH
export PATH=$PATH:$HOME/Desktop/GitHub/rdnajac/.files/bin/
export PATH=$PATH:$HOME/.cargo/bin
# TODO: do I need this if I set editor?
export PATH=$PATH:/opt/nvim-macos-arm64/bin
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
# TODO: symlink to ~/.local/bin (or wherever micromamba is)
