local cmp = require('cmp')
cmp.setup {
    completion = {
        autocomplete = false
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
    sources = {
        {name = 'nvim_lsp'},
        {name = 'orgmode'},
        {name = 'buffer', keyword_length = 8},
        {name = 'path'},
    }
}
