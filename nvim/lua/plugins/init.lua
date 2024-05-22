-- TODO: Move big configuration plugins to their own files
return {
    -- COLORS
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = false,
        priority = 1000,
        config = function()
            require('noirbuddy').setup({
                colors = {
                    primary = "#FFD34D"
                }
            });

            local colorbuddy = require('colorbuddy')
            local colors = colorbuddy.colors
            local groups = colorbuddy.groups
            local styles = colorbuddy.styles
            local Color = colorbuddy.Color
            local Group = colorbuddy.Group

            Color.new('green', '#43BF5C')
            Color.new('light_primary', '#F0750F')

            Group.new('@keyword', colors.primary)
            Group.new('@keyword.return', colors.primary)
            Group.new('@string', colors.green)
            Group.new('@number', colors.light_primary)
            Group.new('@boolean', colors.light_primary)
            Group.new('@constant.builtin', colors.noir_2, nil, styles.bold)
            Group.new('@comment', colors.noir_7, nil, styles.italic)
            Group.link('ErrorMsg', groups.DiffDelete)

            vim.cmd([[
               hi DiagnosticUnderlineError gui=undercurl
               hi DiagnosticUnderlineHint gui=undercurl
               hi DiagnosticUnderlineInfo gui=undercurl
               hi DiagnosticUnderlineWarn gui=undercurl
               hi DiagnosticUnderlineOk gui=undercurl
           ]])
        end
    },
    {
        'b0o/incline.nvim',
        config = function()
            require('incline').setup {
                window = {
                    margin = {
                        vertical = {
                            bottom = 0,
                            top = 0,
                        },
                    },
                },
                hide = {
                    cursorline = false,
                    focused_win = false,
                    only_win = false
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    local icon, color = require('nvim-web-devicons').get_icon_color(filename)

                    local segments = {}

                    if icon and #icon then
                        table.insert(segments, { icon, guifg = color })
                        table.insert(segments, { ' ' })
                    end

                    table.insert(segments, { filename })

                    return segments
                end,
            }
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
                'rust_analyzer',
                'gdscript',
                'clangd',
                'groovyls',
                'gopls'
            }
            require('lsp')(servers)
        end
    },
    { 'norcalli/nvim-colorizer.lua', opts = { 'css', 'scss', 'javascript', 'html' } },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                javascript = { { "prettierd", "prettier" } },
            },
        },
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
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'dcampos/cmp-snippy'
        },
        config = function()
            local cmp = require('cmp')

            local format = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
            })

            cmp.setup({
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
                    ghost_text = false
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
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
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
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require("fzf-lua").setup({})
            require("fzf-lua").register_ui_select()
        end,
        keys = {
            { '<leader>f',  function() require('fzf-lua').files() end,                           desc = 'Find files' },
            { '<leader>b',  function() require('fzf-lua').buffers({ sort_lastused = true }) end, desc = 'Find buffers' },
            { '<leader>/',  function() require('fzf-lua').live_grep_glob() end,                  desc = 'Grep' },
            { '<leader>gs', function() require('fzf-lua').git_status() end,                      desc = 'GIT: Status' },
            { '<leader>gc', function() require('fzf-lua').git_branches() end,                    desc = 'GIT: Branches' },
            { '<leader>:',  function() require('fzf-lua').commands() end,                        desc = 'Find command' },
            { 'gr',         function() require('fzf-lua').lsp_references() end,                  desc = 'Find files' },
            { '<leader>?',  function() require('fzf-lua').keymaps() end,                         desc = 'Find keymap' },
            {
                '<leader>*',
                function() require('fzf-lua').grep_cword() end,
                desc =
                'Grep current word'
            },
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
                options = {
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    globalstatus = true
                },
                sections = {
                    lualine_a = {},
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 1 } },
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
        opts = { default_file_explorer = true },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- GIT
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        lazy = false,
        opts = {
            signs = {
                add = { hl = "GitSignsAdd", text = "┃" },
                change = { hl = "GitSignsChange", text = "┃" },
                delete = { hl = "GitSignsDelete", text = "▁" },
                topdelete = { hl = "GitSignsDelete", text = "▔" },
                changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
                untracked = { hl = "GitSignsUntracked", text = "┃" },
            }
        },
        keys = {
            {
                "<leader>gb",
                function() require('gitsigns').blame_line({ ignore_whitespace = true }) end,
                desc =
                "GIT: Blame current line"
            },
            {
                "<leader>gB",
                function() require('gitsigns').blame_line({ full = true, ignore_whitespace = true }) end,
                desc =
                "GIT: Blame current line (full)"
            },
            {
                ']g',
                function() require('gitsigns').next_hunk() end,
                desc =
                'GIT: Go to next hunk'
            },
            {
                '[g',
                function() require('gitsigns').prev_hunk() end,
                desc =
                'GIT: Go to previous hunk'
            },
            {
                '<leader>gd',
                function() require('gitsigns').diffthis() end,
                mode = 'n',
                desc =
                'GIT: Diff file'
            },
        }
    },
    -- EDITOR
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false
                }
            }
        },
        keys = {
            { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     opts = {
    --         indent = { char = "▏" },
    --         scope = {
    --             enabled = true,
    --             show_start = false,
    --             show_end = false,
    --         }
    --     }
    -- },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>go",
                '<cmd>DiffviewOpen<CR>',
                mode = 'n',
                desc =
                'GIT: View diff against index'
            },
            {
                "<leader>gf",
                '<cmd>DiffviewFileHistory --follow %<CR>',
                mode = 'n',
                desc =
                'GIT: View current file history'
            },
            {
                "<leader>gm",
                '<cmd>DiffViewOpen master<CR>',
                mode = 'n',
                desc =
                'GIT: Diff against master'
            },
            {
                "<leader>gl",
                "<cmd>.DiffviewFileHistory --follow<CR>",
                mode = 'n',
                desc =
                "GIT: File history for the current line"
            },
            {
                "<leader>gd",
                "<esc><cmd>'<,'>DiffviewFileHistory --follow<CR>",
                mode = 'v',
                desc = "GIT: File history for the visual selection"
            }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        version = false,
        opts = {
            highlight = {
                enable = true
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        ["]o"] = "@loop.*",
                        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = 'single',
                    peek_definition_code = {
                        ["<leader>k"] = "@function.outer",
                        -- ["<leader>gD"] = "@class.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
            vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {
            opts = {
                enable_close_on_slash = false,
            }
        }
    },
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
        'echasnovski/mini.ai',
        version = '*'
    },
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({ use_default_keymaps = false, max_join_length = 200 })
        end,
        keys = {
            {
                'gj',
                function()
                    require('treesj').toggle({ split = { recursive = true } })
                end,
                desc = 'Toggle split/join block',
            },
        }
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
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            require('ufo').setup({
                close_fold_kinds_for_ft = {
                    -- default = { 'imports' },
                }
            })
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        end
    },
    {
        "robitx/gp.nvim",
        config = function()
            require("gp").setup()
        end,
    },
}
