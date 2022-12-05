local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- TODO: Move configs to after/plugin
-- TODO: CLEAN IT UP
require('packer').startup(function(use)
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    }
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
        }
    })
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd [[colorscheme tokyonight-moon]]
        end
    }
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local servers = {
                "pylsp",
                "eslint",
                "tsserver",
                "cssls",
                "sumneko_lua",
                "omnisharp",
                "rust_analyzer"
            }
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })
            require("lsp")(servers)
        end
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                },
            })
        end
    }
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-ui-select.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim'}
        }
    }
    use { "junegunn/fzf", run = ":call fzf#install()" }
    use 'tpope/vim-fugitive'
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("diffview").setup({
                view = {
                    merge_tool = {
                        layout = "diff3_mixed",
                    }
                }
            })
        end
    }
    use 'kdheepak/lazygit.nvim'
    use {
        "luukvbaal/nnn.nvim",
        config = function() require("nnn").setup() end
    }
    use {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use "windwp/nvim-ts-autotag"
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        }
    }
    use 'onsails/lspkind.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = {hl = 'GitSignsAdd', text = '▎'},
                    change = {hl = 'GitSignsChange', text = '▎'},
                    delete = {hl = 'GitSignsDelete', text = '◢'},
                    topdelete = {hl = 'GitSignsDelete', text = '◥'},
                    changedelete = {hl = 'GitSignsChangeDelete', text = '▌'},
                }
            }
        end
    }
    use {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    }
    use 'tpope/vim-repeat'
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    }
    use({"L3MON4D3/LuaSnip", tag = "v1.*"})
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                extensions = {
                    'nvim-dap-ui'
                },
                options = {
                    -- theme = 'tokyonight',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    globalstatus = true
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {
                        {
                            'filetype',
                            icon_only = true,
                        },
                        { 'filename', path = 0 }
                    },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ff9e64" },
                        }
                    },
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
            }
        end
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")
        end
    }
end)
