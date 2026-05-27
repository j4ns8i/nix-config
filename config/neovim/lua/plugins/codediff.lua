return {
  {
    'esmuellert/codediff.nvim',
    version = '*',
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>cd", "<cmd>CodeDiff<cr>", desc = "Code Diff" },
    },
  }
}
