-- TODO: Move big configuration plugins to their own files
return {
    -- COLORS
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                disable_italics = true
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
        dependencies = { 'j-hui/fidget.nvim' },
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
        ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
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
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'folke/neodev.nvim',
        ft = 'lua',
        config = function()
            require("neodev").setup({})
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
            local cmp = require('cmp')

            local format = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
            })

            cmp.setup {
                completion = {
                    -- autocomplete = true,
                },
                mapping = {
                    ['<C-p>'] = function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end,
                    ['<C-n>'] = function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end,
                    ['<C-space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    },
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    }
                },
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'snippy' },
                    },
                    {
                        { name = 'path' },
                    },
                    {
                        { name = 'buffer', keyword_length = 6 },
                    }
                ),
                snippet = {
                    expand = function(args)
                        require('snippy').expand_snippet(args.body)
                    end
                },
                experimental = {
                    ghost_text = true
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local original_kind = vim_item.kind
                        local kind = format(entry, vim_item)

                        -- Split the kind from lspkind into two parts so we can place the icon
                        -- on the left and the text on the right. This allows for quick scanning
                        -- on the left near the text while still providing the full completion
                        -- information if needed.
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })

                        if strings[2] == nil then
                            return kind
                        end

                        kind.kind = strings[1] .. " "
                        kind.menu = "   " .. strings[2]

                        -- Highlight the menu text the same as the kind icon
                        kind.menu_hl_group = "CmpItemKind" .. original_kind

                        return kind
                    end,
                },
            }
        end,
    },
    {
        'dcampos/nvim-snippy',
        event = 'InsertEnter',
        opts = {
            mappings = {
                is = {
                    ['<Tab>'] = 'expand_or_advance',
                    ['<S-Tab>'] = 'previous',
                },
                nx = {
                    ['<leader>x'] = 'cut_text',
                },
            },
        }
    },
    -- FUZZY FIND
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup({
                defaults = {
                    path_display = { "truncate" },
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top",
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            preview_height = 0.6,
                            preview_cutoff = 0
                        }
                    },
                    -- file_ignore_patterns = {"^node_modules/", "^.git/"}
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        previewer = false,
                        mappings = {
                            i = { ["<c-d>"] = "delete_buffer" }
                        }
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor()
                    }
                }
            })

            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('projects')
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
            { '<leader>ff', function() require('telescope.builtin').find_files({}) end,         desc = 'Find files' },
            { '<leader>fb', function() require('telescope.builtin').buffers({}) end,            desc = 'Find buffers' },
            { '<leader>gs', function() require('telescope.builtin').git_status({}) end,         desc = 'GIT: Status' },
            { '<leader>/',  function() require('telescope.builtin').live_grep({}) end,          desc = 'Grep' },
            { '<leader>:',  function() require('telescope.builtin').commands() end,             desc = 'Find command' },
            { '<leader>fp', function() require("telescope").extensions.projects.projects() end, desc = 'Find project' }
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
                    theme = 'tokyonight',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    globalstatus = true
                },
                sections = {
                    lualine_a = {},
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 0 } },
                    lualine_x = {},
                    lualine_y = { 'searchcount', 'progress', 'location' },
                    lualine_z = {}
                },
            })
        end
    },
    -- FILES
    {
        'stevearc/oil.nvim',
        lazy = false,
        keys = {
            { '<leader>e', '<cmd>Oil<CR>', desc = 'File explorer' }
        },
        cmd = { 'Oil' },
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
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
        keys = {
            { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Lazygit' }
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
            vim.keymap.set('n', "<leader>gb", function() require('gitsigns').blame_line({ ignore_whitespace = true }) end,
                { desc = "GIT: Blame current line" })
            vim.keymap.set('n', "<leader>gB",
                function() require('gitsigns').blame_line({ full = true, ignore_whitespace = true }) end,
                { desc = "GIT: Blame current line (full)" })
            vim.keymap.set('n', '<leader>]', function() require('gitsigns').next_hunk() end,
                { desc = 'GIT: Go to next hunk' })
            vim.keymap.set('n', '<leader>[', function() require('gitsigns').prev_hunk() end,
                { desc = 'GIT: Go to previous hunk' })
            vim.keymap.set('n', '<leader>gd', function() require('gitsigns').diffthis() end, { desc = 'GIT: Diff file' })
            vim.keymap.set('n', '<leader>gD', function() require('gitsigns').toggle_deleted() end,
                { desc = 'GIT: Toggle deleted' })
        end
    },
    -- EDITOR
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings(true)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        opts = {
            highlight = {
                enable = true
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<S-CR>",
                    node_decremental = "<BS>",
                },
            },
            textobjects = {
                lsp_interop = {
                    enable = true,
                    border = 'single',
                    peek_definition_code = {
                        ["<space>K"] = "@function.outer",
                        -- ["<leader>gD"] = "@class.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    'windwp/nvim-ts-autotag',
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
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
        'echasnovski/mini.ai',
        version = '*'
    },
    {
        'echasnovski/mini.splitjoin',
        version = '*',
        config = function() require('mini.splitjoin').setup({ mappings = { toggle = 'gj', split = '', join = '', }, }) end
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
        config = function()
            require('ufo').setup()
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        end
    },
    -- WIKI
    {
        'mickael-menu/zk-nvim',
        config = function()
            require("zk").setup({
                picker = "telescope",
            })
            vim.keymap.set("n", "<space>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = "New note" })
            vim.keymap.set("n", "<space>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "Open notes" })
            vim.keymap.set("n", "<space>zt", "<Cmd>ZkTags<CR>", { desc = "Open notes by tag" })
            vim.keymap.set("n", "<space>zf",
                "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
                { desc = "Search note" })
            vim.keymap.set("v", "<space>zf", ":'<,'>ZkMatch<CR>", { desc = "Search note with visual selection" })
        end
    },
}
