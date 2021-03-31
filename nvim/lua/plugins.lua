local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

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

    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'

    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use 'tpope/vim-surround'
    use {
    'hrsh7th/vim-vsnip',
        requires = {
            'hrsh7th/vim-vsnip-integ',
            'rafamadriz/friendly-snippets'
        }
    }
    use 'mattn/emmet-vim'

    use 'vimwiki/vimwiki'
    use 'junegunn/goyo.vim'

    use 'skywind3000/asyncrun.vim'
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.cmd [[ hi link FloatermBorder Normal ]]
        end
    }
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
        vsnip = true;
        nvim_lsp = true;
        nvim_lua = true;
    };
}

require('lspsaga').init_lsp_saga()

-- Plugin Options
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_autoclose = 2
vim.g.floaterm_title = ''
vim.g.floaterm_height = 0.8

vim.g.vimwiki_list = {{ path = '~/Wiki', syntax = 'markdown', ext = '.md' }}

vim.g.vsnip_filetypes = {
    javascriptreact = {'javascript'},
    typescriptreact = {'typescript'}
}
