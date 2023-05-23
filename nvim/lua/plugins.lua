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
        'neovim/nvim-lspconfig',
        config = function()
            local servers = {
                'pylsp',
                'eslint',
                'tsserver',
                'cssls',
                'lua_ls',
                'omnisharp',
                'rust_analyzer'
            }
            require('lsp')(servers)
        end
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        ft = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact'},
        config = function()
            local null_ls = require('null-ls')
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                if vim.fn.filereadable('./.prettierrc.yml') == 1 then
                                    vim.lsp.buf.format({ bufnr = bufnr })
                                end
                            end,
                        })
                    end
                end,
            })
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'folke/neodev.nvim',
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'j-hui/fidget.nvim' },
        config = function ()
            require"fidget".setup()
        end
    },
    'onsails/lspkind.nvim',
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'dcampos/cmp-snippy'
        },
        config = function()
            require('plugins.cmp')
        end,
    },
    {
        'dcampos/nvim-snippy',
        event = 'InsertEnter',
        config = function()
            require('plugins.snippy')
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
            "nvim-tree/nvim-web-devicons",
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
                    lualine_a = {},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {{ 'filename', path = 0 }},
                    lualine_x = {},
                    lualine_y = {'searchcount', 'progress', 'location' },
                    lualine_z = {}
                },
            })
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
        'madox2/vim-ai'
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings(true)
        end
    },
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
        'kylechui/nvim-surround',
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
        end
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "markdown" }
            })
        end
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function ()
            require('ufo').setup()
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        end
    },
    -- WIKI
    {
        'mickael-menu/zk-nvim',
        config = function ()
            require("zk").setup({
                picker = "telescope",
            })
            vim.keymap.set("n", "<space>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "New note" })
            vim.keymap.set("n", "<space>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "Open notes" })
            vim.keymap.set("n", "<space>zt", "<Cmd>ZkTags<CR>", { desc = "Open notes by tag" })
            vim.keymap.set("n", "<space>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = "Search note" })
            vim.keymap.set("v", "<space>zf", ":'<,'>ZkMatch<CR>", { desc = "Search note with visual selection" })
        end
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
