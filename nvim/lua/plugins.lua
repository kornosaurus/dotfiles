local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.cmd [[colorscheme tokyonight]]
        end
    }
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'junegunn/fzf'
    use 'tpope/vim-fugitive'
    use 'neovim/nvim-lspconfig'
    use {
        'kevinhwang91/nvim-bqf',
        config = function()
            require('bqf').setup({
                auto_enable = true,
                auto_resize_height = false
            })
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                completion = {
                    autocomplete = {}
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    }
                },
                sources = {
                    {name = "nvim_lsp"},
                    {name = "buffer"},
                    {name = "path"},
                }
            }
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'ggandor/lightspeed.nvim'
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
    use 'mattn/emmet-vim'
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

require("telescope").setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
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
