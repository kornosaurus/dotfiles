return {
  name = "mvn test:single",
  tags = { "test:single" },
  builder = function()
    return {
      cmd = {'mvn'},
      cwd = vim.fs.root(0, {'pom.xml'}),
      args = {'-Dtest=' .. vim.fn.expand('%:t:r') .. '#' .. vim.fn.expand('<cword>'), '-Dsurefire.failIfNoSpecifiedTests=false', 'test', '-Djacoco.skip=true'}
    }
  end,
  priority = 50,
  condition = {
    filetype = {"java"},
  },
}
