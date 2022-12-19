local dap = require('dap')

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js'},
}

dap.adapters.coreclr = {
    type = 'executable',
    command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/netcoredbg',
    args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = require('dap.utils').pick_process,
    },
}

local firefox = {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:1337',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/usr/bin/firefox'
}

dap.configurations.typescript = {firefox}
dap.configurations.javascript = {firefox}
dap.configurations.typescriptreact = {firefox}
dap.configurations.javascriptreact = {firefox}
