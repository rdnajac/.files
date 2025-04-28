# EC2 quick SSH with tmux auto-attach
ec2ssh() {
  local host="$1"
  ssh -t "$host" 'tmux attach || tmux new'
}

# Autocomplete SSH hosts
_ec2ssh_hosts() {
  mapfile -t COMPREPLY < <(awk '/^Host / {for (i=2; i<=NF; i++) print $i}' ~/.ssh/config | grep -v '\*' | grep -v '?')
}
complete -F _ec2ssh_hosts ec2ssh
