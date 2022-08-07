local prettier = {
  formatCommand = "prettierd ${INPUT}",
  formatStdin = true
}

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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)

local servers = {
    "pylsp",
    "csharp_ls",
    "eslint",
    "tsserver",
    "efm",
    "cssls",
    "rls",
    "sumneko_lua",
    "gdscript"
}

-- User configurations for individual servers.
local configs = {
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
    efm = {
        init_options = { documentFormatting = true, codeAction = true },
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "sh",
        },
        settings = {
            rootMarkers = {".eslintrc.json", ".git/"},
            languages = {
                javascript = {prettier},
                javascriptreact = {prettier},
                ["javascript.jsx"] = {prettier},
                typescript = {prettier},
                ["typescript.tsx"] = {prettier},
                typescriptreact = {prettier},
            }
        }
    },
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
    capabilities = require("cmp_nvim_lsp").update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
}

-- Setup configurations.
for _, lsp in ipairs(servers) do
    local config = configs[lsp] or {}
    config = vim.tbl_extend("keep", config, config_defaults)
    require('lspconfig')[lsp].setup(config)
end
