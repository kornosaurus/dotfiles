require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'},
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
                ["<leader>gd"] = "@function.outer",
                ["<leader>gD"] = "@class.outer",
            },
        },
    },
})

