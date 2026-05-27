vim.g.mapleader = " "

vim.keymap.set('n', '<leader>wz', '<cmd>Lazy<cr>', { desc = 'Open Lazy window' })

vim.keymap.set('o', 'i<space>', ':<c-u>normal! T_vt_<cr>')
vim.keymap.set('o', 'a<space>', ':<c-u>normal! F_vf_<cr>')

-- Indent conveniences
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', '<Tab>', '>>')
vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('v', '<Tab>', '>', { remap = true })
vim.keymap.set('v', '<S-Tab>', '<', { remap = true })
vim.keymap.set('i', '<S-Tab>', '<C-d>', { remap = true })

-- Move lines with <Shift-Alt-j/k>
vim.keymap.set('n', '<S-M-k>', ":m .-2<CR>==")
vim.keymap.set('n', '<S-M-j>', ":m .+1<CR>==")
vim.keymap.set('v', '<S-M-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-M-j>', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yp', '"+p')
vim.keymap.set('n', '<leader>yP', '"+P')

-- Restore jump forward after mapping <Tab> (which == <C-i>)
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-p>', '<C-i>zz')

-- Page up / down: vertically centered
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '<C-D>', '<C-D>zz')

vim.keymap.set('n', '``', '``zz')
vim.keymap.set('n', "`'", "`'zz")
vim.keymap.set('n', "'`", "'`zz")
vim.keymap.set('n', "''", "''zz")
vim.keymap.set('n', '`.', '`.zz')
vim.keymap.set('n', "'.", "'.zz")

vim.keymap.set('n', '<leader>[', ':bp<cr>')
vim.keymap.set('n', '<leader>]', ':bn<cr>')
vim.keymap.set('n', '<leader><bs>', '<c-^>')

vim.keymap.set('n', 'Q', '@q')

vim.keymap.set('n', '<leader>mks', ':mksession!<cr>')

vim.keymap.set('n', '<leader>sar', ':%s/<c-r><c-w>//gc<left><left><left>')
vim.keymap.set('v', '<leader>sar', '"sy:%s/\\<<c-r>s\\>//gc<left><left><left>')

vim.keymap.set('v', '<leader>64d', 'c<c-r>=system(\'base64 --decode\', @")<cr><esc>')
vim.keymap.set('v', '<leader>64e', 'c<c-r>=system(\'base64\', @")<cr><esc>')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', '<leader>/<space>', vim.cmd.nohlsearch)

vim.keymap.set('n', 'gg', 'mjgg')
vim.keymap.set('n', 'G', 'mkG')

vim.keymap.set('n', '<leader>in', vim.cmd.Inspect)

vim.keymap.set('n', '<leader>cl', vim.cmd.cclose)

vim.keymap.set('n', '<leader>tc', vim.cmd.tabclose)

vim.keymap.set('n', '<leader>wt',
  function()
    vim.o.wrap = not vim.o.wrap
    vim.print('wrap: ' .. (vim.o.wrap and 'on' or 'off'))
  end,
  { desc = 'Wrap toggle' }
)

vim.keymap.set('n', '<leader>vc', function()
  local config_dir = '~/.config/nvim'
  vim.cmd.tabnew(config_dir)
  vim.cmd.tcd(config_dir)
end)
