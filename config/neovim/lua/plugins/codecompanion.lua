return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    version = '^18.0.0',
    keys = {
      { '<leader>cpc', '<cmd>CodeCompanionChat Toggle<cr>' },
    },
    cmd = {
      'CodeCompanion',
      'CodeCompanionChat',
    },
    opts = {
      interactions = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
          keymaps = {
            accept_change = {
              modes = { n = 'y' },
            },
            reject_change = {
              modes = { n = 'n' },
            },
            always_accept = {
              modes = { n = 'a' },
            },
          },
        }
      },
      display = {
        diff = {
          provider_opts = {
            inline = {
              layout = "buffer", -- float|buffer - Where to display the diff
            },
          },
        },
      },
    },
  }
}
