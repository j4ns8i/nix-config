return {
  'preservim/nerdcommenter',
  keys = {
    { '<leader>c<space>', "<Plug>NERDCommenterToggle", mode = { 'n', 'v' } },
  },
  config = function()
    vim.g.NERDSpaceDelims  = 1      -- add spaces around comment characters
    vim.g.NERDDefaultAlign = 'left' -- align all comment charaters to the left
    vim.g.NERDCreateDefaultMappings = 0
  end
}
