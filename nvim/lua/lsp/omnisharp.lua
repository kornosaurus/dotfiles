local pid = vim.fn.getpid()
local omnisharp_bin = "/home/simon/Programs/omnisharp/run"

require'lspconfig'.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}
