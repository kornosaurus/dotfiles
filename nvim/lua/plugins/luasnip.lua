local imap = require("keymap").imap
local smap = require("keymap").smap

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
imap("<TAB>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", "Expand or jump snippet", { silent=true, expr=true})
imap("<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

smap("<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>")
smap("<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>")

imap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Next luasnip choice", { silent=true, expr=true})
smap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Next luasnip choice", { silent=true, expr=true})

