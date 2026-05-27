return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-n>"] = { "show", "select_next", "fallback" },
      },
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
        menu = {
          draw = {
            columns = {
              { "label",     "label_description", gap = 1, },
              { "kind_icon", "kind",              gap = 1, },
            },
          },
          border = "rounded",
        },
      },
    },
  }
}
