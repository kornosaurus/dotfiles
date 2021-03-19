-- TODO more configuration in lua

require('opts')
require('maps')
require('lsp')

require('nvim_comment').setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

-- telescope
require('telescope').setup{
    defaults = {
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new
    }
}

