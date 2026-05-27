local function setup_diagnostic()
  vim.diagnostic.config({
    virtual_text = { prefix = '<-' },
    signs = false,
  })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '<M-k>', function() vim.diagnostic.jump({ count = -1, float = true }) end)
  vim.keymap.set('n', '<M-j>', function() vim.diagnostic.jump({ count = 1, float = true }) end)
end

local function config()
  vim.lsp.enable({
    'ansiblels',
    'bashls',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'emmet_language_server',
    -- 'eslint',
    'gopls',
    'helm_ls',
    'html',
    'jsonls',
    -- 'jsonnet_ls',
    'lua_ls',
    'nil_ls',
    'pyright',
    'ruff',
    'rust_analyzer',
    'starlark_rust',
    -- 'tailwindcss',
    'templ',
    'terraformls',
    'tflint',
    'ts_ls',
    'vue_ls',
    'yamlls',
    'zls',
  })
  vim.o.winborder = 'rounded'

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition)
  vim.keymap.set('n', 'gC', vim.lsp.buf.incoming_calls)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
  vim.keymap.set('i', '<c-g>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end)
  vim.keymap.set('n', 'go',
    function()
      vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
  )

  setup_diagnostic()
end

config()
