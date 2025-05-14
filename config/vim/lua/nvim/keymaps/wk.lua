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

      { '<localleader>l', desc = '+vimtex' },
      -- { '<localleader>r', group = '+R', icon = { icon = ' ', color = 'blue' } },
      -- { '<localleader>re', group = '++renv' },

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
