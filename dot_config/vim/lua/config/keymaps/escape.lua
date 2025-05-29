-- better escape
local map_combo = require('mini.keymap').map_combo

-- Modes: i = insert, c = command, x = visual, s = select
local modes = { 'i', 'c', 'v', 's' }

-- Map both 'jk' and 'kj' to <Esc> in normal-ish modes
for _, combo in ipairs({ 'jk', 'kj' }) do
  map_combo(modes, combo, '<BS><BS><Esc>')
end

-- Terminal mode: 'jk' and 'kj' to <C-\><C-n>
for _, combo in ipairs({ 'jk', 'kj' }) do
  map_combo('t', combo, '<C-\\><C-n>')
end
