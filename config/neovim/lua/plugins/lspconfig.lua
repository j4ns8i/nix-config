return {
  {
    'neovim/nvim-lspconfig', -- for default configs (e.g. setting file types for all language servers)
    lazy = false,
    keys = {
      { '<leader>wl', '<cmd>checkhealth vim.lsp<cr>', desc = 'Open :checkhealth vim.lsp window' },
    },
  },
}
