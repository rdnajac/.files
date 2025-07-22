# https://junegunn.github.io/fzf/
FZF_ALT_C_COMMAND= source <(fzf --zsh)
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --height=40% \
  --border=none \
  --color=bg+:#283457 \
  --color=bg:#1f2335 \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#283457 \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

FZF_VERSION=$(fzf --version | awk '{print $1}')

if [ "$(printf '%s\n' "0.52" "$FZF_VERSION" | sort -V | head -n1)" = "0.52" ] && [ "$FZF_VERSION" != "0.52" ]; then
	export FZF_DEFAULT_OPTS="--highlight-line $FZF_DEFAULT_OPTS"
fi

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift
#
#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     oil)          fzf --preview 'dig {}'                   "$@" ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }

