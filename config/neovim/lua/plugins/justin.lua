return {
  'justin',
  lazy = false,
  priority = 1000,
  dir = vim.fn.stdpath('config') .. '/lua/justin',
  -- TODO: this feels unnecessary but I can't figure out how to get lazy.nvim to find the module and load it by default
  main = 'justin',
  config = true,
}
