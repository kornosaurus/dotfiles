return {
  name = "mvn clean install",
  builder = function(params)
    return {
      cmd = {'mvn'},
      args = {'clean', 'install'}
    }
  end,
  priority = 50,
  condition = {
    filetype = {"java"},
  },
}
