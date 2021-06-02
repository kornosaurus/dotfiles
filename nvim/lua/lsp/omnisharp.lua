local pid = vim.fn.getpid()
local omnisharp_bin = "/home/simon/Programs/omnisharp/run"

require'lspconfig'.omnisharp.setup {
    on_attach = function()
        require "lsp_signature".on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "single"
            }
        })
    end,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}
