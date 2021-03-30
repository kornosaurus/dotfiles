local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier = {
  formatCommand = "./node_modules/.bin/prettier --stdin-filepath=${INPUT}",
  formatStdin = true
}

require"lspconfig".efm.setup {
    init_options = { documentFormatting = true },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    settings = {
        rootMarkers = {".eslintrc.json"},
        languages = {
            javascript = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            ["javascript.jsx"] = {prettier, eslint},
            typescript = {prettier, eslint},
            ["typescript.tsx"] = {prettier, eslint},
            typescriptreact = {prettier, eslint},
        }
    }
}
