return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { "<leader>'a", function() require('harpoon.mark').add_file() end },
    { "<leader>'q", function() require('harpoon.ui').toggle_quick_menu() end },
    { "<leader>'j", function() require('harpoon.ui').nav_next() end },
    { "<leader>'k", function() require('harpoon.ui').nav_prev() end },
  },
}
