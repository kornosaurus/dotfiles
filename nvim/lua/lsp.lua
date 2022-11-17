local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = '/home/simon/Programs/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

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
    omnisharp = {
        cmd = { "dotnet", "/home/simon/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
    },
    tsserver = {
        capabilities = {
            document_formatting = false
        },
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
        end
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
    cssls = { cmd = { "css-languageserver", "--stdio" } },
    sumneko_lua = {
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
            },
        },
    },
    gdscript = {
        flags = {
            debounce_text_changes = 150,
        }
    }
}

-- User configurations for all servers.
local config_defaults = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- Setup configurations.
return function(servers)
    for _, lsp in ipairs(servers) do
        local config = configs[lsp] or {}
        config = vim.tbl_extend("keep", config, config_defaults)
        require('lspconfig')[lsp].setup(config)
    end
end
