return {
  settings = {
    gopls = {
      buildFlags = { '-tags', 'functional,integration' },
      semanticTokens = true,
      usePlaceholders = true,
    }
  }
}
