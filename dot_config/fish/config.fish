/opt/homebrew/bin/brew shellenv | source

if status is-interactive # commands to run in interactive sessions go here
  chezmoi completion fish | source
  thefuck --alias         | source
  zoxide init fish        | source
  starship init fish      | source

  if test -f ~/.bash_aliases
    source ~/.bash_aliases # fish handles `alias` and `export` natively
  end

  if test -n "$NVIM"
    echo "Setting up OSC 7 for Neovim terminal"
    function __print_osc7 --on-variable PWD
      printf '\033]7;file://%s\033\\' "$PWD"
    end
  end
end

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "/Users/rdn/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/rdn/.cache/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
