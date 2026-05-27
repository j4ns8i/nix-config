local filetypes = {
  'lua',
  'javascript',
  'jsx',
  'typescript',
  'typescriptreact',
  'css',
  'go',
  'rust',
  'python',
  'make',
  'jsonnet'
}

local function set_highlights()
  local colors = require('base16-colorscheme').colors
  vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = colors.base02 })
  vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'IlluminatedWordText' })
  vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'IlluminatedWordText' })
end

return {
  'RRethy/vim-illuminate',
  dependencies = {
    'rrethy/base16-nvim',
  },
  ft = filetypes,
  config = function()
    set_highlights()
    local opts = {
      delay = 250,
      filetypes_allowlist = filetypes,
      filetypes_denylist = {},
      min_count_to_highlight = 2,
    }
    require('illuminate').configure(opts)
  end
}
