~/.local/bin/nvim --headless --noplugin \
	--server ~/.cache/nvim/server.pipe \
	--remote-expr "getcwd()"
