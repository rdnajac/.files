return {
  'R-nvim/R.nvim',
  opts = {
    -- R_args = { '--quiet', '--no-save' },
    R_args = { '--quiet' },
    -- TODO: remoteR
    -- R_app = vim.fn.expand('~/.files/bin-scripts/sshR'),
    -- R_cmd = vim.fn.expand('~/.files/bin-scripts/sshR'),
    -- cpmpldir = vim.fn.expand('~/.remoteR'),
    -- remote_compldir = '/home/remotelogin/.cache/R.nvim',
    -- local_R_library_dir = '/path/to/local/R/library', -- where nvimcom is installed
  },
}
