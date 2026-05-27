local function set_highlights()
  local colors = require('base16-colorscheme').colors

  -- mode_color returns a common set of mode color themes with one primary color
  -- as the 'a' and 'z' section backgrounds
  local mode_color = function(primary_bg)
    return {
      a = { bg = primary_bg, fg = colors.base00 },
      b = { bg = colors.base02, fg = colors.base04 },
      c = { bg = colors.base01, fg = colors.base03 }
    }
  end
  local theme = {
    normal = mode_color(colors.base0D),
    insert = mode_color(colors.base0B),
    visual = mode_color(colors.base0E),
    replace = mode_color(colors.base08),
    command = mode_color(colors.base09),
    inactive = mode_color(colors.base03),
  }
  return theme
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'rrethy/base16-nvim',
  },
  opts = function()
    local theme = set_highlights()
    return {
      options = {
        icons_enabled = true,
        component_separators = '',
        section_separators = { left = '', right = '' },
        theme = theme,
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = '' }, fmt = function(s) return s:sub(1,1) end, padding = 0 },
        },
        lualine_b = {
          { 'filename', separator = { left = '', right = '' }, newfile_status = true, path = 1, },
        },
        lualine_c = {
          { 'diff', },
          { 'diagnostics', },
        },
        lualine_x = {
          { 'filetype', },
          { 'lsp_status', icon = '⏻', },
        },
        lualine_y = {
          { 'progress', },
        },
        lualine_z = {
          { 'location', separator = { left = '', right = '' }, padding = 0, },
        },
      },
      inactive_sections = {
        lualine_c = {
          { 'filename', newfile_status = true, path = 1, },
        },
      },
      extensions = {
        'fugitive',
        'fzf',
        'neo-tree',
        'quickfix',
        'trouble',
      }
    }
  end
}
