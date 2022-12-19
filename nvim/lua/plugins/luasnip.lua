local luasnip_status_ok, ls = pcall(require, 'luasnip')
if not luasnip_status_ok then
    vim.notify('luasnip not found')
    return
end

ls.config.set_config({
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI'
})

require("luasnip.loaders.from_snipmate").lazy_load({paths = {"./snippets/snipmate"}})
require("luasnip.loaders.from_lua").lazy_load({paths = {"./snippets/lua-snip"}})

ls.filetype_extend("typescriptreact", { "javascriptreact" })

-- Maps
vim.keymap.set('i', "<TAB>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", { silent=true, expr=true, desc= "Expand or jump snippet"})
vim.keymap.set('i', "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

vim.keymap.set('s', "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>")
vim.keymap.set('s', "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>")

vim.keymap.set('i', "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent=true, expr=true})
vim.keymap.set('s', "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", { silent=true, expr=true})

