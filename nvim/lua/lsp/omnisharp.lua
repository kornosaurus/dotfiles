local pid = vim.fn.getpid()
local omnisharp_bin = "/home/simon/Programs/omnisharp/run"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
}

require'lspconfig'.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    capabilities = capabilities
}
