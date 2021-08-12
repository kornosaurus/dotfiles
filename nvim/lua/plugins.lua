local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.cmd [[colorscheme tokyonight]]
        end
    }
    use 'kevinhwang91/nvim-bqf'
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'ggandor/lightspeed.nvim'
    use 'steelsojka/pears.nvim'
    use 'tpope/vim-surround'
    use 'sirver/UltiSnips'
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                    section_separators = '',
                    component_separators = ''
                }
            }
        end
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'vimwiki/vimwiki'
    use 'mhinz/vim-startify'
    use 'vim-test/vim-test'
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.cmd [[ hi link FloatermBorder Normal ]]
        end
    }
end)

-- Plugin Setup
require('pears').setup()

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
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = false;
        ultisnips = true;
    };
}

require('bqf').setup {
    auto_resize_height = false,
}

require("telescope").setup {
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    pickers = {
        buffers = {
            theme = "dropdown",
            sort_lastused = true,
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    },
}
require('telescope').load_extension('fzf')

-- Plugin Options
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_autoclose = 2
vim.g.floaterm_title = ''
vim.g.floaterm_height = 0.8

vim.g.vimwiki_list = {{ path = '~/Wiki', syntax = 'markdown', ext = '.md' }}

vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"
vim.g.UltiSnipsSnippetDirectories={ os.getenv('HOME') .. '/.config/nvim/UltiSnips' }

vim.g.startify_custom_header = {}
vim.g.startify_change_to_dir = 0

vim.g["test#strategy"] = "floaterm"
vim.g["test#javascript#runner"] = "jest"
vim.g["test#javascriptreact#runner"] = "jest"
vim.g["test#typescript#runner"] = "jest"
vim.g["test#typescriptreact#runner"] = "jest"
