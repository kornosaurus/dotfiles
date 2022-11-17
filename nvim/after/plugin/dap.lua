require("dapui").setup()

local dap = require('dap')

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js"}
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

local chrome = {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
}

dap.configurations.typescript = {chrome}
dap.configurations.javascript = {chrome}
dap.configurations.typescriptreact = {chrome}
dap.configurations.javascriptreact = {chrome}
