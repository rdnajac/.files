vim.cmd("source ~/.vim/vimrc")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
  require("lazy").setup({
    ui = {
      border = "rounded",
    },
    change_detection = {
      enabled = true,
      notify = false,
    },
    install = { colorscheme = { "tokyonight-night" } },
    spec = {
      { import = "plugins" },
      {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd([[colorscheme tokyonight-night]])
        end,
      },
    },
  })
  end,
})

