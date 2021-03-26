require('packer').startup(function(use)
    use {
        'bluz71/vim-nightfly-guicolors',
        config = function()
            vim.cmd [[colorscheme nightfly]]
        end
    }

    use 'wbthomason/packer.nvim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use {
        'neovim/nvim-lspconfig'
    }
    use 'hrsh7th/nvim-compe'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sbdchd/neoformat'

    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use 'tpope/vim-surround'
    use 'SirVer/ultisnips'
    use 'mattn/emmet-vim'

    use 'vimwiki/vimwiki'
    use 'junegunn/goyo.vim'

    use 'skywind3000/asyncrun.vim'
    use 'voldikss/vim-floaterm'
end)

-- Plugin Setup
require('gitsigns').setup {
    signs = {
        add = {hl = 'GitSignsAdd', text = '▎'},
        change = {hl = 'GitSignsChange', text = '▎'},
        delete = {hl = 'GitSignsDelete', text = '◢'},
        topdelete = {hl = 'GitSignsDelete', text = '◥'},
        changedelete = {hl = 'GitSignsChangeDelete', text = '▌'},
    }
}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

require('compe').setup {
    enabled = true;
    autocomplete = false;

    source = {
        path = true;
        buffer = true;
        calc = false;
	vsnip = false;
        nvim_lsp = true;
        nvim_lua = true;
    };
}

-- Plugin Options
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_autoclose = 2
vim.g.floaterm_title = ''
vim.g.floaterm_height = 0.8

vim.g.vimwiki_list = {{ path = '~/Wiki', syntax = 'markdown', ext = '.md' }}

vim.g.UltiSnipsSnippetDirectories={ os.getenv('HOME') .. '/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"
