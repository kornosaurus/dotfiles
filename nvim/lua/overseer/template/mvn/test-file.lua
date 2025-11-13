return {
  name = "mvn test:file",
  tags = { "test:file" },
  builder = function()
    return {
      cmd = {'mvn'},
      cwd = vim.fs.root(0, {'pom.xml'}),
      args = {'-Dtest=' .. vim.fn.expand('%:t:r') , '-Dsurefire.failIfNoSpecifiedTests=false', 'test', '-Djacoco.skip=true'}
    }
  end,
  priority = 50,
  condition = {
    filetype = {"java"},
  },
}
