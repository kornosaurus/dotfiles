require("neodev").setup({})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = "single"
    }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)

-- User configurations for individual servers.
local configs = {
    sumneko_lua = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                }
            }
        }
    },
    omnisharp = {
        cmd = { "dotnet", "/home/simon/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
        on_attach = function(client)
           client.server_capabilities.semanticTokensProvider = nil
        end
    },
    tsserver = {
    },
    rls = {
        settings = {
            rust = {
                unstable_features = true,
                build_on_save = false,
                all_features = true,
            },
        },
    },
    cssls = {},
    gdscript = {
        flags = {
            debounce_text_changes = 150,
        }
    }
}

return function(servers)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, lsp in ipairs(servers) do
        local config = configs[lsp] or {}
        config = vim.tbl_extend(
            "keep",
            config,
            { vim.tbl_extend("keep", config.capabilities or {}, capabilities) }
        )
        require('lspconfig')[lsp].setup(config)
    end
end
