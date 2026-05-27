local function is_quickfix_open()
  return vim.fn.getqflist({ winid = 0 }).winid ~= 0
end

local function qf_next_quickfix()
  local qf_info = vim.fn.getqflist({ size = 0, idx = 0 })
  if qf_info.idx ~= qf_info.size then
    vim.cmd.cnext()
  end
end

local function qf_next_trouble()
  require('trouble').next({ jump = true, focus = false })
end

local function qf_next()
  if is_quickfix_open() then
    qf_next_quickfix()
  else
    qf_next_trouble()
  end
  vim.cmd [[ normal zz<cr> ]]
end

local function qf_previous_quickfix()
  local qf_info = vim.fn.getqflist({ size = 0, idx = 0 })
  if qf_info.idx ~= 1 then
    vim.cmd.cprevious()
  end
end

local function qf_previous_trouble()
  require('trouble').prev({ jump = true, focus = false })
end

local function qf_previous()
  if is_quickfix_open() then
    qf_previous_quickfix()
  else
    qf_previous_trouble()
  end
  vim.cmd [[ normal zz<cr> ]]
end

vim.keymap.set('n', '<up>', qf_previous, { desc = "Next quickfix / trouble entry" })
vim.keymap.set('n', '<down>', qf_next, { desc = "Previous quickfix / trouble entry" })

vim.keymap.set('n', '<leader>q<bs>', vim.cmd.cclose, { desc = "Close quickfix window" })
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, { desc = "Open diagnostics in quickfix list" })

vim.keymap.set('n', '<leader>l<bs>', vim.cmd.lclose, { desc = "Close location list" })
