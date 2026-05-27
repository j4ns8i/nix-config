vim.filetype.add(
  {
    pattern = {
      ["Tiltfile"] = "starlark",
      [".*%.[Tt]iltfile"] = "starlark"
    }
  }
)
