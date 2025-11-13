return {
  name = "jest test",
  tags = { "test" },
  builder = function(params)
    return {
      cmd = {'npx', 'jest'},
      cwd = vim.fs.root(0, {'package.json'}),
    }
  end,
  priority = 50,
  condition = {
    filetype = {"javascript", "typescript", "typescriptreact", "javascriptreact"},
  },
}
