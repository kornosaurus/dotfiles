local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- TODO: Move keymaps to "init" function
-- This will allow lazy loading without duplicating keymaps in the "keys" field
require("lazy").setup({
    -- COLORS
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                dark_variant = 'moon',
                disable_italics = true,
            })
            vim.cmd('colorscheme rose-pine')
        end,
    },
    -- LSP
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local servers = {
                'pylsp',
                'eslint',
                'tsserver',
                'cssls',
                'sumneko_lua',
                'omnisharp',
                'rust_analyzer'
            }
            require('mason-lspconfig').setup({
                ensure_installed = servers
            })
            require('lsp')(servers)
        end
    },
    'folke/neodev.nvim',
    'neovim/nvim-lspconfig',
    {
        'jose-elias-alvarez/null-ls.nvim',
        ft = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact'},
        config = function()
            local null_ls = require('null-ls')

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                },
            })
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'onsails/lspkind.nvim',
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            require('plugins.cmp')
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require('plugins.luasnip')
        end,
    },
    -- FUZZY FIND
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('plugins.telescope')
        end,
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
        cmd = { 'Telescope' },
        keys = {
            '<space>ff',
            '<space>fb',
            '<space>gs',
            '<space>/',
            '<space>*',
            '<space>ca',
        }
    },
    -- LINES
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require('lualine').setup({
                extensions = {
                    'nvim-dap-ui'
                },
                options = {
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
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
            })
        end
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require("bufferline").setup({
                options = {
                    max_name_length = 22,
                    tab_size = 22,
                    diagnostics = "nvim_lsp",
                    show_close_icon = false,
                    close_icon = '',
                    show_buffer_close_icon = false,
                    buffer_close_icon = '',
                    separator_style = "slant",
                    numbers = function(opts)
                        return string.format('%s', opts.raise(opts.ordinal))
                    end,
                }
            })
            vim.keymap.set('n', '<space>,', '<cmd>BufferLineMovePrev<CR>')
            vim.keymap.set('n', '<space>.', '<cmd>BufferLineMoveNext<CR>')
            vim.keymap.set('n', '<space>1', '<cmd>BufferLineGoToBuffer 1<CR>')
            vim.keymap.set('n', '<space>2', '<cmd>BufferLineGoToBuffer 2<CR>')
            vim.keymap.set('n', '<space>3', '<cmd>BufferLineGoToBuffer 3<CR>')
            vim.keymap.set('n', '<space>4', '<cmd>BufferLineGoToBuffer 4<CR>')
            vim.keymap.set('n', '<space>5', '<cmd>BufferLineGoToBuffer 5<CR>')
            vim.keymap.set('n', '<space>6', '<cmd>BufferLineGoToBuffer 6<CR>')
            vim.keymap.set('n', '<space>7', '<cmd>BufferLineGoToBuffer 7<CR>')
            vim.keymap.set('n', '<space>8', '<cmd>BufferLineGoToBuffer 8<CR>')
            vim.keymap.set('n', '<space>9', '<cmd>BufferLineGoToBuffer 9<CR>')
        end
    },
    -- FILES
    {
        'luukvbaal/nnn.nvim',
        config = function()
            require('plugins.nnn')
        end,
        cmd = 'NnnPicker',
        keys = { '<space>e' },
    },
    -- GIT
    {
        'sindrets/diffview.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require('diffview').setup({
                view = {
                    merge_tool = {
                        layout = 'diff3_mixed',
                    }
                }
            })
            vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { desc = 'Git diff' })
        end,
        cmd = {
            'DiffviewOpen',
            'DiffviewLog',
            'DiffviewFileHistory',
        },
        keys = {
            "<space>gd"
        }
    },
    {
        'kdheepak/lazygit.nvim',
        config = function()
            require('plugins.lazygit')
        end,
        keys = {
            '<space>gg'
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        event = { 'BufRead' },
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = {hl = 'GitSignsAdd', text = '▎'},
                    change = {hl = 'GitSignsChange', text = '▎'},
                    delete = {hl = 'GitSignsDelete', text = '◢'},
                    topdelete = {hl = 'GitSignsDelete', text = '◥'},
                    changedelete = {hl = 'GitSignsChangeDelete', text = '▌'},
                }
            })
            vim.keymap.set('n', "<leader>gb", ":lua require('gitsigns').blame_line({ ignore_whitespace=true })<CR>", {desc="Blame current line"})
            vim.keymap.set('n', "<leader>gB", ":lua require('gitsigns').blame_line({ full=true, ignore_whitespace=true })<CR>", {desc="Blame current line (full)"})
        end
    },
    -- EDITOR
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins.treesitter')
        end,
    },
    'windwp/nvim-ts-autotag',
    {
        'Wansmer/treesj',
        keys = { 'gj' },
        config = function()
            require('plugins.treesj')
        end,
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end,
        keys = {
            's',
            'S',
        }
    },
    'tpope/vim-repeat',
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
        end,
    },
    {
        'echasnovski/mini.surround',
        config = function()
            require('mini.surround').setup()
        end
    },
    {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
        end
    },
    {
        'echasnovski/mini.pairs',
        config = function()
            require('mini.pairs').setup()
        end
    },
    -- WIKI
    {
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.neorg')
        end,
        cmd = 'Neorg',
        ft = 'norg',
        build = ':Neorg sync-parsers',
        keys = {
            '<space>n'
        },
    },
     -- UTILITY
     { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } },
     -- DAP
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('plugins.dap')
        end,
        keys = {
            '<space>b',
            '<space>B',
            '<space>dr',
            '<space>du',
            '<F5>',
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        dependencies = { 'mfussenegger/nvim-dap' }
    }
})
