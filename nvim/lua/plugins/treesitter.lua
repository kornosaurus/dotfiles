require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
        },
    },
    textobjects = {
        lsp_interop = {
            enable = true,
            border = 'single',
            peek_definition_code = {
                ["<space>K"] = "@function.outer",
                -- ["<leader>gD"] = "@class.outer",
            },
        },
    },
})

