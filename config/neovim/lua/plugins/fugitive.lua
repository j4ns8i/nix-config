return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gb',  '<cmd>Git blame<cr>',    desc = "Git blame" },
    { '<leader>gcv', '<cmd>Gvdiffsplit!<cr>', desc = "Git vertical diff split" }, -- (g)it (c)onflict resolve (v)ertical
    { '<leader>gch', '<cmd>Gdiffsplit!<cr>',  desc = "Git horizontal diff split" }, -- (g)it (c)onflict resolve (h)orizontal
  },
  cmd = {
    'Git',
    'Gvdiffsplit',
    'Gdiffsplit',
  },
}
