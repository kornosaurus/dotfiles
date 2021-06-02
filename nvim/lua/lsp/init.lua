vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = true,
        signs = true,
    }
)

require('lsp/sumneko')
require('lsp/omnisharp')
require('lsp/tsserver')
require('lsp/efm')
require('lsp/css')
require('lsp/rls')
