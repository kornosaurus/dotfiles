require("noice").setup({
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "search_count",
            },
            opts = { skip = true },
        },
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
        {
            filter = {
                error = true,
                find = "E21",
            },
            opts = { skip = true },
        },
        {
            filter = {
                event = "msg_show",
                find = "ESC",
            },
            opts = { skip = true },
        },
    },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        signature = {
            enabled = false,
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true -- add a border to hover docs and signature help
    },
})
