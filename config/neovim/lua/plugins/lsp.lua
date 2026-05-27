return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      'justin',
    },
    lazy = false,
    keys = {
      { '<leader>wl', vim.cmd.LspInfo, desc = 'Open LspInfo window' },
    },
  },
}
