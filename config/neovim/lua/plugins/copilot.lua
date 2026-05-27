return {
  {
    'github/copilot.vim',
    keys = {
      { '<leader>cld', '<cmd>Copilot disable<cr>', { desc = "Copilot disable" } },
      { '<leader>cle', '<cmd>Copilot enable<cr>',  { desc = "Copilot enable" } },
      { '<leader>cls', '<cmd>Copilot status<cr>',  { desc = "Copilot status" } },
    },
    cmd = { 'Copilot' },
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      local keymap_opts = { silent = true, noremap = false, replace_keycodes = false }
      local expr_opts = vim.tbl_extend('keep', keymap_opts, { expr = true })
      vim.keymap.set('i', '<a-j>', 'copilot#Accept()', expr_opts)
      vim.keymap.set('i', '<a-l>', '<Plug>(copilot-accept-line)', keymap_opts)
      vim.keymap.set('i', '<a-w>', '<Plug>(copilot-accept-word)', keymap_opts)
      vim.keymap.set('i', '<a-n>', '<Plug>(copilot-next)', keymap_opts)
      vim.keymap.set('i', '<a-p>', '<Plug>(copilot-previous)', keymap_opts)
      vim.keymap.set('i', '<a-;>', '<Plug>(copilot-dismiss)', keymap_opts)
    end,
  }
}
