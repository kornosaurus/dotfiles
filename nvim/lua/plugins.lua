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
    -- DEV
    {
        dir = '/Users/sk/git/multi-cursor.nvim',
    },
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
        'neovim/nvim-lspconfig',
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
            require('lsp')(servers)
        end
    },
    'folke/neodev.nvim',
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'j-hui/fidget.nvim' },
        config = function ()
            require"fidget".setup()
        end
    },
   -- {
   --     'jose-elias-alvarez/null-ls.nvim',
   --     ft = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact'},
   --     config = function()
   --         local null_ls = require('null-ls')
   --         null_ls.setup({
   --             sources = {
   --                 null_ls.builtins.formatting.eslint,
   --             },
   --         })
   --     end,
   --     dependencies = { 'nvim-lua/plenary.nvim' },
   -- },
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
                build = 'make',
            },
        },
        cmd = { 'Telescope' },
        keys = {
            '<space>ff',
            '<space>fp',
            '<space>fb',
            '<space>gs',
            '<space>c',
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
                    show_buffer_icons = false,
                    show_buffer_close_icon = false,
                    buffer_close_icon = '',
                    separator_style = "slant",
                    numbers = function(opts)
                        return string.format('%s', opts.raise(opts.ordinal))
                    end,
                    custom_filter = function(buf_number)
                        -- filter out filetypes you don't want to see
                        if vim.bo[buf_number].filetype ~= "qf" then
                            return true
                        end
                    end,
                }
            })
            vim.keymap.set('n', '<C-j>', '<cmd>BufferLineCycleNext<CR>')
            vim.keymap.set('n', '<C-k>', '<cmd>BufferLineCyclePrev<CR>')
            vim.keymap.set('n', '<C-[>', '<cmd>BufferLineMovePrev<CR>')
            vim.keymap.set('n', '<C-]>', '<cmd>BufferLineMoveNext<CR>')
            vim.keymap.set('n', '<space>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<CR>')
            vim.keymap.set('n', '<space>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<CR>')
            vim.keymap.set('n', '<space>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<CR>')
            vim.keymap.set('n', '<space>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<CR>')
            vim.keymap.set('n', '<space>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<CR>')
            vim.keymap.set('n', '<space>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<CR>')
            vim.keymap.set('n', '<space>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<CR>')
            vim.keymap.set('n', '<space>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<CR>')
            vim.keymap.set('n', '<space>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<CR>')
        end
    },
    -- FILES
    {
        'luukvbaal/nnn.nvim',
        config = function()
            require('plugins.nnn')
        end,
        cmd = { 'NnnPicker', 'NnnExplorer' },
        keys = { '<space>e', '<space>E' },
    },
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require("project_nvim").setup({
                detection_methods = { "pattern" },
                patterns = { ".git" },
            })
        end
    },
    -- GIT
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
                    add = { hl = "GitSignsAdd", text = "┃" },
                    change = { hl = "GitSignsChange", text = "┃" },
                    delete = { hl = "GitSignsDelete", text = "▁" },
                    topdelete = { hl = "GitSignsDelete", text = "▔" },
                    changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
                    untracked = { hl = "GitSignsUntracked", text = "┃" },
                }
            })
            vim.keymap.set('n', "<leader>gb", function() require('gitsigns').blame_line({ ignore_whitespace=true }) end, {desc="GIT: Blame current line"})
            vim.keymap.set('n', "<leader>gB", function() require('gitsigns').blame_line({ full=true, ignore_whitespace=true }) end, {desc="GIT: Blame current line (full)"})
            vim.keymap.set('n', '<leader>]', function() require('gitsigns').next_hunk() end, {desc='GIT: Go to next hunk'})
            vim.keymap.set('n', '<leader>[', function() require('gitsigns').prev_hunk() end, {desc='GIT: Go to previous hunk'})
            vim.keymap.set('n', '<leader>gd', function() require('gitsigns').diffthis() end, {desc='GIT: Diff file'})
            vim.keymap.set('n', '<leader>gD', function() require('gitsigns').toggle_deleted() end, {desc='GIT: Toggle deleted'})
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
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
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
