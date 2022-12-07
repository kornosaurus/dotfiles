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
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        signature = {
            enabled = false,
            view = nil,
            opts = {},
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true
    },
})
