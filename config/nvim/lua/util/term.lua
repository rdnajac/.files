local function new_terminal(lang)
  vim.cmd('vsplit term://' .. lang)
end
local function new_terminal_python()
  new_terminal('python')
end
local function new_terminal_r()
  new_terminal('R       --no-save')
end
local function new_terminal_ipython()
  new_terminal('ipython --no-confirm-exit')
end
local function new_terminal_julia()
  new_terminal('julia')
end
local function new_terminal_shell()
  new_terminal('$SHELL')
end
-- stylua: ignore start

local keys = {
    { "<leader><cr>", send_cell, desc = "run code cell" },
    { "<leader>ci", new_terminal_ipython, desc = "new [i]python terminal" },
    { "<leader>cj", new_terminal_julia, desc = "new [j]ulia terminal" },
    { "<leader>cn", new_terminal_shell, desc = "[n]ew terminal with shell" },
    { "<leader>cp", new_terminal_python, desc = "new [p]ython terminal" },
    { "<leader>cr", new_terminal_r, desc = "new [R] terminal" },
  }
