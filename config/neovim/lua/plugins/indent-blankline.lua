local function set_highlights()
  local colors = require('base16-colorscheme').colors
  vim.api.nvim_set_hl(0, 'IblIndent', { fg = colors.base01 })
  vim.api.nvim_set_hl(0, '@ibl.indent.char.1', { link = 'IblIndent' })
end

return {
  'lukas-reineke/indent-blankline.nvim',
  dependencies = {
    'rrethy/base16-nvim',
  },
  config = function()
    set_highlights()
    require('ibl').setup({
      indent = {
        char     = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
    })
  end
}
