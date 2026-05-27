local function set_rounded_window()
  -- Overriding vim dictionaries from lua is a whole song and dance
  local opts = vim.g.gitgutter_floating_window_options
  opts.border = 'rounded'
  vim.g.gitgutter_floating_window_options = opts
end

local function set_highlights()
end

return {
  'airblade/vim-gitgutter',
  dependencies = { 'justin' },
  keys = {
    { '<leader>gs', '<cmd>GitGutterStageHunk<cr>',   desc = 'Stage hunk' },
    { '<leader>gu', '<cmd>GitGutterUndoHunk<cr>',    desc = 'Undo hunk' },
    { '<leader>gp', '<cmd>GitGutterPreviewHunk<cr>', desc = 'Preview hunk' },
    { '<End>',      '<cmd>GitGutterNextHunk<cr>',    desc = 'GitGutter Next hunk' },
    { '<leader>j',  '<cmd>GitGutterNextHunk<cr>',    desc = 'GitGutter Next hunk' },
    { '<Home>',     '<cmd>GitGutterPrevHunk<cr>',    desc = 'GitGutter Previous hunk' },
    { '<leader>k',  '<cmd>GitGutterPrevHunk<cr>',    desc = 'GitGutter Previous hunk' },
  },
  event = 'VeryLazy',
  config = function()
    -- Use rounded window for previews
    set_rounded_window()

    set_highlights()

    -- Don't set mappings by default
    vim.g.gitgutter_map_keys = 0
  end
}
