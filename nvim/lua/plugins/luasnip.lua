local luasnip_status_ok, ls = pcall(require, 'luasnip')
if not luasnip_status_ok then
    vim.notify('luasnip not found')
    return
end

ls.config.set_config({
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI'
})

require("luasnip.loaders.from_vscode").lazy_load() -- Friendly snippets
require("luasnip.loaders.from_snipmate").lazy_load({paths = {"./snippets/snipmate"}})
require("luasnip.loaders.from_lua").lazy_load({paths = {"./snippets/lua-snip"}})

ls.filetype_extend("typescriptreact", { "javascriptreact" })
ls.filetype_extend("typescript", { "javascript" })

-- Maps
vim.keymap.set('i', "<TAB>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<Tab>]], true, true, true), 'n', true)
    end
end , { desc= "Expand or jump snippet"})
vim.keymap.set('i', "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

vim.keymap.set('s', "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>")
vim.keymap.set('s', "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>")

vim.keymap.set('i', "<C-E>", "<Plug>luasnip-next-choice", { silent=true })
vim.keymap.set('s', "<C-E>", "<Plug>luasnip-next-choice", { silent=true })

