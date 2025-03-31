#!/bin/bash
pane_pid=$(tmux display-message -p "#{pane_pid}")

# Walk down the child process tree
current_pid=$pane_pid
while true; do
	child_pid=$(pgrep -P "$current_pid" | head -n 1)
	[ "$child_pid" = "" ] && break
	current_pid=$child_pid
done

ps -p "$current_pid" -o comm= 2> /dev/null
