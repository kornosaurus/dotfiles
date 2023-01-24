require("nnn").setup({
    picker = {
        style = {
			width = 0.6,
			height = 0.7,
			xoffset = 0.5,
			yoffset = 0.5,
			border = "single"
		}
    }
})

vim.keymap.set('n', '<leader>e', ':NnnPicker %:p:h<CR>')
vim.keymap.set('n', '<leader>E', ':NnnPicker<CR>')
