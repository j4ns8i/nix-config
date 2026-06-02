local function call_hunk_fn(fn)
  local mode = vim.api.nvim_get_mode().mode
  if mode == "n" then
    fn()
  else
    fn({ vim.fn.line('.'), vim.fn.line('v') })
    vim.cmd.normal('gv')
  end
end

return {
  {
    'lewis6991/gitsigns.nvim',
    keys = {
      {
        'ih',
        '<cmd>Gitsigns select_hunk<cr>',
        mode = { 'o', 'x' },
      },
      {
        '<leader>j',
        '<cmd>Gitsigns nav_hunk next --wrap=false<cr>',
      },
      {
        '<leader>k',
        '<cmd>Gitsigns nav_hunk prev --wrap=false<cr>',
      },
      {
        '<leader>gp',
        '<cmd>Gitsigns preview_hunk_inline<cr>',
      },
      {
        '<leader>gs',
        function() call_hunk_fn(require('gitsigns').stage_hunk) end,
        mode = { 'n', 'v', },
      },
      {
        '<leader>gr',
        function() call_hunk_fn(require('gitsigns').reset_hunk) end,
        mode = { 'n', 'v', },
      },
    },
    lazy = false,
    config = true,
  },
}
