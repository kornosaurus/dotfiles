local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- TODO: Move configs to after/plugin
require('packer').startup(function(use)
    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                routes = {
                    {
                        filter = {
                            event = "msg_show",
                            kind = "search_count",
                        },
                        opts = { skip = true },
                    },
                    {
                        filter = {
                            event = "msg_show",
                            kind = "",
                            find = "written",
                        },
                        opts = { skip = true },
                    },
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true -- add a border to hover docs and signature help
                },
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        }
    })
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "moon"
            vim.cmd [[colorscheme tokyonight]]
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
                "tailwindcss"
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
    -- use 'tpope/vim-fugitive'
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
    use 'ThePrimeagen/harpoon'
    use {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'
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
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    }
    use {
        'dcampos/nvim-snippy',
        config = function()
            require('snippy').setup({
                mappings = {
                    is = {
                        ['<Tab>'] = 'expand_or_advance',
                        ['<S-Tab>'] = 'previous',
                    },
                    nx = {
                        ['<leader>x'] = 'cut_text',
                    },
                },
            })
        end
    }
    use 'dcampos/cmp-snippy'
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                extensions = {
                    'nvim-dap-ui'
                },
                options = {
                    theme = 'tokyonight',
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
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                { path = '~/Wiki/', syntax = 'markdown', ext = '.md' }
            }
        end
    }
end)
