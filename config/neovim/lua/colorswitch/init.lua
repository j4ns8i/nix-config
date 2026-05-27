local M = {}

-- Adapted from https://rrethy.github.io/book/colorscheme.html

function M.setup(_)
  -- set_colorscheme(vim.fn.readfile(base16_theme_fname)[1])
  vim.keymap.set('n', '<leader>pc', function()
    -- get our base16 colorschemes
    local colors = vim.fn.getcompletion('base16', 'color')
    local filtered_colors = vim.tbl_filter(function(color)
      return not string.match(color, "light")
    end, colors)
    -- we're trying to mimic VSCode so we'll use dropdown theme
    local theme = require('telescope.themes').get_dropdown()
    local telescope_action_set = require('telescope.actions.set')
    local telescope_actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    -- create our picker
    require('telescope.pickers').new(theme, {
      prompt = 'Change Base16 Colorscheme',
      finder = require('telescope.finders').new_table {
        results = filtered_colors
      },
      sorter = require('telescope.config').values.generic_sorter(theme),
      attach_mappings = function(bufnr)
        -- change the colors upon selection
        telescope_actions.select_default:replace(function()
          local colorscheme = action_state.get_selected_entry().value
          vim.cmd.colorscheme(colorscheme)
          telescope_actions.close(bufnr)
        end)
        telescope_action_set.shift_selection:enhance({
          -- change the colors upon scrolling
          post = function()
            local colorscheme = action_state.get_selected_entry().value
            vim.cmd.colorscheme(colorscheme)
          end
        })
        return true
      end
    }):find()
  end)
end

return M
