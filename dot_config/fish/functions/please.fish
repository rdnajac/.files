function please
  set last_command (history --max=1)
  set_color yellow
  echo $last_command
  set_color normal
  # execute the last command with sudo if it was not
  if test (string match -r '^sudo' $last_command)
    eval $last_command
  else
    eval "sudo $last_command"
  end
end
