return {
  'folke/trouble.nvim',
  cmd = {
    'Trouble',
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    {
      '<leader>x<bs>',
      function() require('trouble').close() end,
      desc = "Close Trouble",
    },
    {
      '<leader>xC',
      function() require('trouble').open('lsp_incoming_calls') end,
      desc = "LSP Incoming Calls",
    },
    {
      '<leader>xd',
      function() require('trouble').open('diagnostics') end,
      desc = "Diagnostics",
    },
    {
      '<leader>xq',
      function() require('trouble').open('quickfix') end,
      desc = "Quickfix",
    },
    {
      '<leader>xl',
      function() require('trouble').open('loclist') end,
      desc = "Location List",
    },
    {
      '<leader>xr',
      function() require('trouble').open('lsp_references') end,
      desc = "LSP References",
    },
    {
      '<leader>xi',
      function() require('trouble').open('lsp_implementations') end,
      desc = "LSP Implementations",
    },
    {
      '<leader>xO',
      function() require('trouble').open('lsp_document_symbols') end,
      desc = "LSP Document Symbols",
    },
  },
  opts = function()
    vim.api.nvim_create_autocmd("QuickFixCmdPost", {
      callback = function()
        vim.cmd([[Trouble qflist open]])
      end,
    })

    return {
      focus = true,
      modes = {
        lsp_document_symbols = {
          mode = "lsp_document_symbols",
          win = { position = "right", size = 40 },
          format = '{kind_icon} {symbol.name}',
        },
        lsp_incoming_calls = {
          auto_jump = true,
          auto_refresh = false,
        },
        lsp_implementations = {
          auto_jump = true,
          auto_refresh = false,
        },
        lsp_base = {
          params = {
            include_current = true,
          }
        },
        lsp_references = {
          auto_refresh = false,
        },
      }
    }

  end
}
