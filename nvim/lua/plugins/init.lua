-- TODO: Move big configuration plugins to their own files
return {
  -- COLORS
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      }
    },
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  'onsails/lspkind.nvim',
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
      { '<leader>e', function() require('oil').open(nil, {}) end, desc = 'File explorer' }
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
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "▁" },
        topdelete = { text = "▔" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
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
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>go",
        function ()
          if next(require('diffview.lib').views) == nil then
            vim.cmd('DiffviewOpen')
          else
            vim.cmd('DiffviewClose')
          end
        end,
        mode = 'n',
        desc =
          'GIT: Diff view'
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
            ["<leader>K"] = "@function.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
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
          },
          ['<C-j>'] = cmp.mapping.confirm {
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
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
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
    opts = {
      preset = "helix"
    }
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup()
    end
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
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },
}
