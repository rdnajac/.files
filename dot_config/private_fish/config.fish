if status is-interactive
  # Commands to run in interactive sessions can go here

  # `eval` processes the output of command substitutions
  eval (/opt/homebrew/bin/brew shellenv)
  eval ($MAMBA_EXE shell hook -s fish)

  # pipe command outputs to `source`for completions
  chezmoi completion fish | source
  thefuck --alias | source
  zoxide init fish | source

  # fish can handle `alias` and `export` natively
  if test -f ~/.bash_aliases
    source ~/.bash_aliases
  end

  # if we're in a Neovim terminal, set up OSC 7 to
  # update the terminal's current working directory
  if test -n "$NVIM"
    echo "Setting up OSC 7 for Neovim terminal"
    function __print_osc7 --on-variable PWD
      printf '\033]7;file://%s\033\\' "$PWD"
    end
  end
end
