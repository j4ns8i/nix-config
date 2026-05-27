vim.cmd.filetype 'plugin on' -- Ensure filetype plugins are enabled
vim.o.updatetime = 50        -- Update every 100ms (default is 4s)

-- TODO read truecolors from file rather than relying on cterm colors. This
-- has the benefit of allowing more than just 16 colors
vim.o.termguicolors = true

vim.o.relativenumber = true    -- Show relative line numbers
vim.o.number         = true    -- But still show current line number
vim.o.signcolumn     = 'yes:1' -- Always show 1 (pair of) columns for signs (gitgutter)
vim.o.colorcolumn    = '+1'    -- Highlight the column at tw+1

vim.o.listchars = 'tab:  ,trail:·,extends:»,nbsp:␣,precedes:«'
vim.o.list      = true

vim.o.ignorecase = true -- Ignore cases in search
vim.o.smartcase  = true -- unless different cases are used

vim.o.linebreak   = true    -- Break at reasonable characters (see 'breakat')
vim.o.breakindent = true    -- Indent broken lines accordingly
vim.o.showbreak   = '  \\ ' -- Format line breaks

vim.o.scrolloff = 3 -- Start scrolling before cursor hits top/bottom

-- Different terminals handle mouse scroll events differently. E.g. ghostty
-- appears to translate one event into 5 lines by default, while alacritty
-- chooses 3. These are configurable. My strategy is to inherit these values in
-- neovim rather than trying to configure them myself. By setting these to 1,
-- neovim will effectively use the terminal's multiplier.
vim.o.mousescroll = 'ver:1,hor:1'

-- When splitting windows, keep what you're working on in the "main" position
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.expandtab = true -- Use spaces instead of tabs

vim.o.shiftwidth  = 4
vim.o.tabstop     = 4
vim.o.softtabstop = 4

vim.o.smartindent = true

vim.o.foldmethod = 'indent' -- Fold based on indent level
vim.o.foldlevel  = 99       -- Start with all folds expanded

vim.opt.nrformats:append { 'alpha' } -- Add or subtract letters with ctrl-a / ctrl-x

vim.opt.completeopt:append { 'noinsert', 'popup' }

vim.o.textwidth = 80 -- 80 is just a good width, ok?
vim.o.wrap = false

-- see fo-table for other options
vim.opt.formatoptions = {
  ['1'] = true, -- break just before one-letter words if possible
  ['2'] = true, -- use indent of second line for rest of paragraph
  ['c'] = true, -- auto-wrap comments using textwidth
  ['q'] = true, -- allow formatting with gq
  ['j'] = true, -- remove comment leader when joining lines
  ['o'] = true, -- auto-insert comment leader with o or O
  ['r'] = true, -- auto-insert comment leader with <cr> in insert mode
}

vim.o.showmode = false -- Don't show mode, e.g. "-- INSERT --", in command line

vim.o.undofile = true -- Persist undo information

-- Sometimes I like to wipe out ~/.local/state/nvim for testing installations
-- and whatnot. I don't want to lose my undo history just because of that.
-- vim.o.undodir = vim.fs.normalize('~/.nvim-undo')

vim.o.guicursor = '' -- Use block cursor

vim.o.cursorline = true

-- By default, neovim only associates .tf viles with the terraform filetype if
-- there are terraform contents, meaning new files aren't recognized. I don't
-- care about other tf filetypes like TinyFugue: https://github.com/neovim/neovim/blob/v0.9.5/runtime/lua/vim/filetype/detect.lua#L1298
vim.filetype.add({
  extension = {
    tf = 'terraform'
  },
})
