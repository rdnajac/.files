local is_code_chunk = function()
  local current, _ = require('otter.keeper').get_current_language_context()
  if current then
    return true
  else
    return false
  end
end

--- Insert code chunk of given language
--- Splits current chunk if already within a chunk
--- @param lang string
local insert_code_chunk = function(lang)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'n', true)
  local keys
  if is_code_chunk() then
    keys = [[o```<cr><cr>```{]] .. lang .. [[}<esc>o]]
  else
    keys = [[o```{]] .. lang .. [[}<cr>```<esc>O]]
  end
  keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
end

-- stylua: ignore start
local insert_r_chunk     = function() insert_code_chunk 'r'      end
local insert_py_chunk    = function() insert_code_chunk 'python' end
local insert_lua_chunk   = function() insert_code_chunk 'lua'    end
local insert_julia_chunk = function() insert_code_chunk 'julia'  end
local insert_bash_chunk  = function() insert_code_chunk 'bash'   end
local insert_ojs_chunk   = function() insert_code_chunk 'ojs'    end

local function new_terminal(lang)     vim.cmd('vsplit term://' .. lang) end
local function new_terminal_python()  new_terminal    'python' end
local function new_terminal_r()       new_terminal    'R       --no-save'         end
local function new_terminal_ipython() new_terminal    'ipython --no-confirm-exit' end
local function new_terminal_julia()   new_terminal    'julia'  end
local function new_terminal_shell()   new_terminal    '$SHELL' end
-- stylua: ignore start

local keys = {
    { "<leader><cr>", send_cell, desc = "run code cell" },
    { "<leader>ci", new_terminal_ipython, desc = "new [i]python terminal" },
    { "<leader>cj", new_terminal_julia, desc = "new [j]ulia terminal" },
    { "<leader>cn", new_terminal_shell, desc = "[n]ew terminal with shell" },
    { "<leader>cp", new_terminal_python, desc = "new [p]ython terminal" },
    { "<leader>cr", new_terminal_r, desc = "new [R] terminal" },

    { "<leader>oj", insert_julia_chunk, desc = "[j]ulia code chunk" },
    { "<leader>ol", insert_lua_chunk, desc = "[l]lua code chunk" },
    { "<leader>oo", insert_ojs_chunk, desc = "[o]bservable js code chunk" },
    { "<leader>op", insert_py_chunk, desc = "[p]ython code chunk" },
    { "<leader>or", insert_r_chunk, desc = "[r] code chunk" },
  }
