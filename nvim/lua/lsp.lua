-- JS/TS
vim.lsp.enable('vtsls')
vim.lsp.enable('eslint')

-- C
vim.lsp.enable('clangd')

-- Godot
vim.lsp.start({
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
  root_dir = vim.fs.root(0, {'project.godot'})
})

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
