local prettier = {
  formatCommand = "prettierd ${INPUT}",
  formatStdin = true
}

local shellsheck = {
    lintCommand = 'shellcheck -f gcc -x',
    lintSource = 'shellcheck',
    lintFormats = {
      '%f:%l:%c: %trror: %m',
      '%f:%l:%c: %tarning: %m',
      '%f:%l:%c: %tote: %m',
    }
}

require"lspconfig".efm.setup {
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
            sh = { shellsheck }
        }
    },
    commands = {
        Format = {
            function()
                vim.lsp.buf.formatting()
            end
        }
    }
}
