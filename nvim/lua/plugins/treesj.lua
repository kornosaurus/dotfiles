require('treesj').setup({
    use_default_keymaps = false,
})

vim.keymap.set('n', 'gj', ':TSJToggle<CR>', {desc = 'Split/Join toggle'})
