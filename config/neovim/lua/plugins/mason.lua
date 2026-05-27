local function set_highlights()
end

return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
      },
    },
    lazy = false,
    keys = {
      { '<leader>wm', '<cmd>Mason<cr>', desc = 'Open Mason window'},
    },
    dependencies = { 'justin' },
    config = function(_, opts)
      require('mason').setup(opts)
      set_highlights()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'gopls',
        'pyright',
        'terraformls',
        'tflint',
        'bashls',
        'docker_compose_language_service',
        'dockerls',
        'starlark_rust',
        'tailwindcss',
        'emmet_language_server',
        'cssls',
        'ts_ls',
        'jsonls',
        'html',
      },
    },
  },
}
