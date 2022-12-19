local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- TODO: Move configs to plugins/<pluginname>.lua
-- TODO: Improve lazy load
require('packer').startup(function(use)
    use({ 'wbthomason/packer.nvim' })
    use({ 'lewis6991/impatient.nvim' })

    -- LSP
    use({
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
        {
            'neovim/nvim-lspconfig',
            module_pattern = { 'lspconfig.*' },
            event = { 'InsertEnter', 'CursorMoved' },
        },
        {
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                local null_ls = require('null-ls')

                null_ls.setup({
                    sources = {
                        null_ls.builtins.formatting.prettierd,
                    },
                })
            end,
            after = 'nvim-lspconfig',
            requires = { 'nvim-lua/plenary.nvim' },
        },
        {'onsails/lspkind.nvim', after = 'nvim-lspconfig'}
    })

    -- CMP
    use({
        {
            'hrsh7th/nvim-cmp',
            module = { 'nvim-cmp', 'cmp' },
            config = function()
                require('plugins.cmp')
            end,
            event = 'InsertEnter *',
        },
        {
            'L3MON4D3/LuaSnip',
            tag = 'v1.*',
            module = { "luasnip", "LuaSnip" },
            config = function()
                require('plugins.luasnip')
            end,
        },
        { 'hrsh7th/cmp-nvim-lsp', module_pattern = { 'cmp_nvim_lsp' } },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    })

    -- FUZZY FIND
    use({
        'nvim-telescope/telescope.nvim',
        module_pattern = 'telescope.*',
        config = function()
            require('plugins.telescope')
        end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            { 'nvim-telescope/telescope-ui-select.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
        cmd = { 'Telescope' },
        keys = {
            '<leader>ff',
            '<leader>fb',
            '<leader>gs',
            '<leader>/',
            '<leader>*',
        }
    })

    -- LINES
    use({
        {
            'nvim-lualine/lualine.nvim',
            module = 'lualine',
            requires = {
                { 'kyazdani42/nvim-web-devicons' },
            },
            event = { 'BufRead' },
            config = function()
                require('lualine').setup {
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
                }
            end
        },
        {
            'akinsho/bufferline.nvim',
            tag = 'v3.*',
            requires = {'nvim-tree/nvim-web-devicons'},
            config = function()
                require('plugins.bufferline')
            end,
            event = { 'BufRead' },
        }
    })

    -- FILES
    use(
        {
            'luukvbaal/nnn.nvim',
            config = function()
                require('plugins.nnn')
            end,
            cmd = 'NnnPicker',
            keys = { { 'n', '<leader>e' } },
        }
    )

    -- GIT
    use({
        {
            'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
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
                "<leader>gd"
            }
        },
        {
            'kdheepak/lazygit.nvim',
            config = function()
                require('plugins.lazygit')
            end,
            keys = {
                { 'n', '<leader>gg' }
            }
        },
        {
            'lewis6991/gitsigns.nvim',
            requires = {
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
                vim.keymap.set('n', "<leader>gB", ":lua require('gitsigns').blame_line({ full=true, ignore_whitespace=true  })<CR>", {desc="Blame current line (full)"})
            end
        }
    })

    ---- EDITOR
    use({
        {
            'nvim-treesitter/nvim-treesitter',
            module_pattern = { 'treesitter' },
            config = function()
                require('plugins.treesitter')
            end,
            event = { 'InsertEnter', 'CursorMoved', 'WinScrolled' },
        },
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
            requires = 'nvim-treesitter/nvim-treesitter',
        },
        {
            'windwp/nvim-ts-autotag',
            after = 'nvim-treesitter',
            requires = 'nvim-treesitter/nvim-treesitter',
        },
        {
            'windwp/nvim-autopairs',
            requires = 'nvim-treesitter/nvim-treesitter',
            after = 'nvim-treesitter',
            config = function() require('nvim-autopairs').setup() end
        },
        {
            'Wansmer/treesj',
            requires = 'nvim-treesitter/nvim-treesitter',
            after = 'nvim-treesitter',
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
                {'n', 's'},
                {'n', 'S' },
            }
        },
        {'tpope/vim-repeat', event = { 'BufRead' }},
        {
            'kylechui/nvim-surround',
            tag = '*',
            config = function()
                require('nvim-surround').setup({})
            end,
            keys = {
                { 'n', 'cs' },
                { 'n', 'ds' },
                { 'n', 'ys' },
                { 'v', 'S' },
            },
        },
        {
            'folke/which-key.nvim',
            config = function()
                require('which-key').setup()
            end,
            event = {'BufRead'}
        }
    })

    ---- WIKI
    use({
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.neorg')
        end,
        cmd = 'Neorg',
        keys = {
            {'n', '<leader>n'}
        },
    })

    -- UI & COLORS
   use(
       {
           'rose-pine/neovim',
           as = 'rose-pine',
           config = function()
               require('rose-pine').setup({
                   dark_variant = 'moon',
                   disable_italics = true,
               })
               vim.cmd('colorscheme rose-pine')
           end
       }
   )

    -- UTILITY
    use({ 'dstein64/vim-startuptime', cmd = { 'StartupTime' } })

    -- DAP
    use({
        {
            'mfussenegger/nvim-dap',
            config = function()
                require('plugins.dap')
            end,
            keys = {
                '<leader>b',
                '<leader>B',
                '<leader>dr',
                '<leader>du',
                '<F5>',
            }
        },
        {
            'rcarriga/nvim-dap-ui',
            config = function()
                require("dapui").setup()
            end,
            after = "nvim-dap"
        }
    })
end)
