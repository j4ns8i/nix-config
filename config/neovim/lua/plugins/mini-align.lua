return {
  'nvim-mini/mini.align',
  config = true,
  keys = {
    { 'ga', mode = { 'n', 'v' } },
    { 'gA', mode = { 'n', 'v' } },
  },
  opts = function()
    local mini = require('mini.align')
    return {
      modifiers = {
        ['|'] = function(steps, opts)
          local trim = mini.gen_step.trim('both', 'keep')
          table.insert(steps.pre_justify, trim)
          opts.split_pattern = '|'
          opts.merge_delimiter = ' '
        end,
      }
    }
  end,
}
