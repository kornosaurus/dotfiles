local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"},
    lintIgnoreExitCode = true,
}

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
            javascript = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            ["javascript.jsx"] = {eslint, prettier},
            typescript = {eslint, prettier},
            ["typescript.tsx"] = {eslint, prettier},
            typescriptreact = {eslint, prettier},
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
