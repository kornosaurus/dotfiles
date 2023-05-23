local cmp = require('cmp')

local format = require("lspkind").cmp_format({
    mode = "symbol_text",
    maxwidth = 50,
})

cmp.setup {
    completion = {
        -- autocomplete = true,
    },
    mapping = {
        ['<C-p>'] = function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end,
        ['<C-n>'] = function()
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end,
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }
    },
    sources = cmp.config.sources(
        {
            {name = 'nvim_lsp'},
            {name = 'snippy'},
        },
        {
            {name = 'path'},
        },
        {
            {name = 'buffer', keyword_length = 6},
        }
    ),
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end
    },
    experimental = {
        ghost_text = true
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local original_kind = vim_item.kind
            local kind = format(entry, vim_item)

            -- Split the kind from lspkind into two parts so we can place the icon
            -- on the left and the text on the right. This allows for quick scanning
            -- on the left near the text while still providing the full completion
            -- information if needed.
            local strings = vim.split(kind.kind, "%s", { trimempty = true })

            if strings[2] == nil then
                return kind
            end

            kind.kind = strings[1] .. " "
            kind.menu = "   " .. strings[2]

            -- Highlight the menu text the same as the kind icon
            kind.menu_hl_group = "CmpItemKind" .. original_kind

            return kind
        end,
    },
}
