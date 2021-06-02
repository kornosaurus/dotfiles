local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

require('lspconfig').rls.setup {
    capabilities = capabilities,
    on_attach = function()
        require "lsp_signature".on_attach({
            bind = true,
            handler_opts = {
                border = "single"
            }
        })
    end,
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    },
}
