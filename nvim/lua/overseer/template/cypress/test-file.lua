return {
  name = "cypress test:file",
  tags = { "test:file" },
  builder = function(params)
    return {
      cmd = {
        'npx',
        'cypress',
        'run',
        '--e2e',
        '--headless',
        '--browser',
        'chrome',
        '--env',
        'LOCAL_RUN=true',
        '--spec',
        vim.fn.expand('%'),
      },
      cwd = vim.fs.root(0, {'package.json'}),
    }
  end,
  priority = 49,
  condition = {
    filetype = {"javascript"},
    dir = "cypress"
  },
}
