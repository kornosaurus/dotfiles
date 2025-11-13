return {
  name = "mvn test",
  tags = { "test" },
  builder = function(params)
    return {
      cmd = {'mvn'},
      cwd = vim.fs.root(0, {'pom.xml'}),
      args = {'test', '-Djacoco.skip=true'}
    }
  end,
  priority = 50,
  condition = {
    filetype = {"java"},
  },
}
