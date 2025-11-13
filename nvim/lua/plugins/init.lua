-- TODO: Move big configuration plugins to their own files
return {
  -- COLORS
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('duckbones')
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
          cursorline = true,
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
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>lf',
        function()
          -- If autoformat is currently disabled for this buffer,
          -- then enable it, otherwise disable it
          if vim.b.disable_autoformat then
            vim.cmd 'FormatEnable'
            vim.notify 'Enabled autoformat for current buffer'
          else
            vim.cmd 'FormatDisable!'
            vim.notify 'Disabled autoformat for current buffer'
          end
        end,
        desc = 'Toggle autoformat for current buffer',
      },
      {
        '<leader>lF',
        function()
          -- If autoformat is currently disabled globally,
          -- then enable it globally, otherwise disable it globally
          if vim.g.disable_autoformat then
            vim.cmd 'FormatEnable'
            vim.notify 'Enabled autoformat globally'
          else
            vim.cmd 'FormatDisable'
            vim.notify 'Disabled autoformat globally'
          end
        end,
        desc = 'Toggle autoformat globally',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        local disable_filetypes = { c = false, cpp = false }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        java = { 'google-java-format', stop_after_first = true }
      },
    },
    config = function(_, opts)
      require('conform').setup(opts)

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- :FormatDisable! disables autoformat for this buffer only
          vim.b.disable_autoformat = true
        else
          -- :FormatDisable disables autoformat globally
          vim.g.disable_autoformat = true
        end
      end, {
          desc = 'Disable autoformat-on-save',
          bang = true, -- allows the ! variant
        })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
          desc = 'Re-enable autoformat-on-save',
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
        "<cmd>DiffviewFileHistory --follow<CR>",
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
    opts = {},
  },
  {
    'stevearc/overseer.nvim',
    opts = {
      templates = { "builtin", "mvn", "jest" },
      task_list = {
        min_height = 12
      }
    },
    keys = {
      { '<leader>tT', function()
        local overseer = require("overseer")
        overseer.run_template({ tags = {'test'} })
        overseer.open({ enter = false })
      end, desc = 'Run tests'},
      { '<leader>tt', function()
        local overseer = require("overseer")
        overseer.run_template({ tags = {'test:single'} })
        overseer.open({ enter = false })
      end, desc = 'Run under cursor'},
      { '<leader>tf', function()
        local overseer = require("overseer")
        overseer.run_template({ tags = {'test:file'} })
        overseer.open({ enter = false })
      end, desc = 'Run test file'},
      { '<leader>or', '<cmd>OverseerRun<CR>', desc = 'Overseer: Run' },
      { '<leader>oo', '<cmd>OverseerToggle!<CR>', desc = 'Overseer: Toggle' },
      { '<leader>ol', function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
        end
      end, desc = 'Overseer: Rerun last task' }
    },
  },
  {
    'mfussenegger/nvim-jdtls',
    dependencies = {
      {
        'mfussenegger/nvim-dap',
        config = function () 
          local dap = require('dap')
          dap.configurations.java = {
            {
              type = 'java';
              request = 'attach';
              name = "Debug (Attach) - Remote";
              hostName = "localhost";
              port = 8787;
            },
          }
        end
      }
    },
  },
}

