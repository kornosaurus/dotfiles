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
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                }
            }
        }
    },
    groovyls = {
        cmd = { "java", "-jar",
            "/Users/sk/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    },
    omnisharp = {
        cmd = { "dotnet", "/Users/sk/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
        end
    },
    tsserver = {
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                }
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                }
            }
        }
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
    clangd = {},
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
            { vim.tbl_extend("keep", config.capabilities or {}, capabilities, {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }) }
        )
        require('lspconfig')[lsp].setup(config)
    end
end
