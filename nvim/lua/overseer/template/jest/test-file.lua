return {
  name = "jest test:file",
  tags = { "test:file" },
  builder = function(params)
    return {
      cmd = {'npx', 'jest', '--', vim.fn.expand('%')},
      cwd = vim.fs.root(0, {'package.json'}),
    }
  end,
  priority = 50,
  condition = {
    filetype = {"javascript", "typescript", "typescriptreact", "javascriptreact"},
  },
}
