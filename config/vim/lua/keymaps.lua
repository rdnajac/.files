-- vim.keymap.set('n', 'gp', '<Cmd>e <cfile>:p:h<CR>', { desc = 'Goto Parent Directory' })
vim.keymap.set('n', 'zS', vim.show_pos, { desc = 'Inspect Pos' })
vim.keymap.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
vim.keymap.set(
  'n',
  '<leader>ur',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw/Clear hlsearch/Diff Update' }
)

vim.keymap.set('n', '<leader>cd', function()
  vim.ui.input({ prompt = 'Change Directory: ', default = vim.fn.getcwd() }, function(input)
    if input then
      vim.cmd('cd ' .. input)
    end
    vim.cmd('pwd')
  end)
end, { desc = 'Change Directory' })

vim.keymap.set('n', '<leader>K', '<Cmd>norm! K<CR>', { desc = 'Keywordprg' })

vim.keymap.set('n', '<leader>w', function()
  if vim.bo.modified then
    vim.cmd('write')
    print('file saved!')
  else
    print('no changes to save')
  end
end, { desc = 'Save if modified' })

vim.keymap.set('n', '<leader>q', function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('quit')
  end
end, { desc = 'Smart Quit' })

vim.keymap.set('n', '<leader>Q', '<Cmd>qa<CR>', { desc = 'Quit All' })

vim.keymap.set('n', '<leader>db', '<Cmd>BlinkCmp status<CR>', { desc = 'Blink' })
vim.keymap.set('n', '<leader>dl', '<Cmd>checkhealth lsp<CR>', { desc = 'LSP' })
vim.keymap.set('n', '<leader>ds', '<Cmd>checkhealth snacks<CR>', { desc = 'Snacks Health' })
vim.keymap.set('n', '<leader>dS', ':=require("snacks").meta.get()<CR>', { desc = 'Snacks' })

vim.keymap.set('n', '<leader>fD', '<Cmd>Delete!<CR>', { desc = 'Delete File (and buffer) from disk' })

vim.keymap.set('n', '<leader>ga', ':!git add %<CR>', { desc = 'Git Add (file)' })

vim.keymap.set('n', '\\i', ':e ' .. vim.fn.stdpath('config') .. '/init.lua<CR>', { desc = 'init.lua' })
vim.keymap.set('n', '\\s', ':e ' .. vim.fn.expand('~/.ssh/config') .. '<CR>', { desc = 'ssh' })

vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  -- LazyVim.cmp.actions.snippet_stop()
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })


require('better_escape').setup({
  mappings = {
    i = {
      j = {
        k = '<Esc>',
        j = '<Esc>',
      },
      k = { j = '<Esc>' },
    },
    c = {
      j = {
        k = '<Esc>',
        j = '<Esc>',
      },
      k = { j = '<Esc>' },
    },
    t = {
      j = { k = '<C-\\><C-n>' },
      k = { j = '<C-\\><C-n>' },
    },
    v = {
      j = { k = '<Esc>' },
      k = { j = '<Esc>' },
    },
    s = {
      j = { k = '<Esc>' },
      k = { j = '<Esc>' },
    },
  },
})

require('which-key').setup({
  show_help = false,
  keys = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  preset = 'helix',
  sort = { 'order', 'alphanum', 'mod' },
  spec = {
    {
      mode = { 'n' },
      { '<leader>c', group = 'code' },
      { '<leader>d', group = 'debug' },
      { '<leader>dp', group = 'profiler' },
      { '<leader>s', group = 'search/grep' },
      { '<leader>t', group = 'toggle' },
      { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
      { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },

      -- add icons for existing (vim) keymaps
      { '<leader>A', icon = { icon = ' ', color = 'azure' }, desc = 'Select All' },
      { '<leader>r', icon = { icon = ' ', color = 'azure' } },
      { '<leader>v', icon = { icon = ' ', color = 'azure' } },
        -- stylua: ignore start
        { '<leader>b', group = 'buffer',  expand = function() return require('which-key.extras').expand.buf() end, },
        { '<c-w>',     group = 'windows', expand = function() return require('which-key.extras').expand.win() end, },
      -- stylua: ignore end
    },

    mode = { 'n', 'v' },
    { '[', group = 'prev' },
    { ']', group = 'next' },
    { 'g', group = 'goto' },
    { 'z', group = 'fold' },
    { '<leader>g', group = 'git' },

    -- better descriptions
    { 'gx', desc = 'Open with system app' },

    -- keep things tidy
    { 'g~', hidden = true },
    { 'gc', hidden = true },
  },
})
