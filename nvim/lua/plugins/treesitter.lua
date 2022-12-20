require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    textobjects = {
        lsp_interop = {
            enable = true,
            border = 'single',
            peek_definition_code = {
                ["<leader>K"] = "@function.outer",
                -- ["<leader>gD"] = "@class.outer",
            },
        },
    },
})

