local colors = {
    bg = "#0B0F18",
    bg_light = "#111725",
    fg = "#ffffff",
    tint_0 = "#191919",
    tint_1 = "#323232",
    tint_2 = "#4c4c4c",
    tint_3 = "#666666",
    tint_4 = "#7f7f7f",
    tint_5 = "#999999",
    tint_6 = "#b2b2b2",
    tint_7 = "#cccccc",
    tint_8 = "#e5e5e5",
    primary = '#FFD34D',
    green = '#43BF5C',
    red = '#ff0038'
}

vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg_light })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.tint_1 })

-- treesitter
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.primary })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.primary })
vim.api.nvim_set_hl(0, "@string", { fg = colors.green })
