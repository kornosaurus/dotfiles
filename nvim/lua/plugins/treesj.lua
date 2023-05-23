require('treesj').setup({
    use_default_keymaps = false,
    max_join_length = 500,
})

vim.keymap.set('n', 'gj', ':TSJToggle<CR>', {desc = 'Split/Join toggle'})
