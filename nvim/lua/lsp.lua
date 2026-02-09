-- JS/TS
vim.lsp.enable('vtsls')
vim.lsp.enable('eslint')

-- C
vim.lsp.enable('clangd')

-- Godot
vim.lsp.config('gdscript', {})
vim.lsp.enable('gdscript')

vim.diagnostic.config({
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  }
})
