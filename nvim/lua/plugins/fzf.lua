  return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 1000,
    lazy = false,
    config = function()
      require("fzf-lua").register_ui_select()
      require("fzf-lua").setup({
        -- preview_opts = 'hidden',
        winopts = {
          border = "rounded",
          preview = {
            border = "rounded",
            layout = "vertical",
          }
        },
        files = {
          git_icons = true,
          -- path_shorten = true,
          formatter = "path.filename_first"
        },
        lsp = {
          code_actions = {
            previewer = false,
          },
        },
      })
      function npm_run(opts)
        require("fzf-lua").fzf_exec('jq -r ".scripts | keys | .[]" package.json', {
          prompt = "Run> ",
          actions = {
            ['default'] = function(selected, opts)
              local command = 'npm run ' .. selected[1]
              local set_title = 'wezterm.exe cli set-tab-title \\"' .. command .. '\\"';

              if opts.bang then
                os.execute(
                  'wezterm.exe cli split-pane -- zsh -i --login -c "' .. set_title .. ';cd ' .. vim.fn.getcwd() .. '; ' .. command .. '"'
                )
              else
                os.execute(
                  'wezterm.exe cli spawn -- zsh -i --login -c "' .. set_title .. ';cd ' .. vim.fn.getcwd() .. '; ' .. command .. '"'
                )
              end
            end
          }
        })
      end

      vim.api.nvim_create_user_command(
        'NpmRun',
        npm_run,
        { bang = true }
      )

      function open_project()
        require('fzf-lua').fzf_exec("projects", {
          prompt = "PROJECT> ",
          actions = {
            ['default'] = function(selected, opts)
              local path = os.getenv("REPOS_PATH") .. "/" .. selected[1]
              require('fzf-lua').files({
                cwd = path
              })
            end
          }
        })
      end

      vim.keymap.set('n', '<leader>p', open_project, {desc = "Find project"})
      vim.keymap.set('v', '<leader>c', function() require('fzf-lua').lsp_code_actions() end, {desc = "LSP: Code action"})
    vim.keymap.set('n', '<leader>c', function() require('fzf-lua').lsp_code_actions() end, {desc = "LSP: Code action"})
  end,
  keys = {
    { '<leader>f',  function() require('fzf-lua').files() end,                           desc = 'Find files' },
    { '<leader>b',  function() require('fzf-lua').buffers({ sort_lastused = true }) end, desc = 'Find buffers' },
    { '<leader>/',  function() require('fzf-lua').live_grep() end,                       desc = 'Grep' },
    { '<leader>gs', function() require('fzf-lua').git_status() end,                      desc = 'GIT: Status' },
    { '<leader>gc', function() require('fzf-lua').git_branches() end,                    desc = 'GIT: Branches' },
    { '<leader>:',  function() require('fzf-lua').commands() end,                        desc = 'Find command' },
    { 'gr',         function() require('fzf-lua').lsp_references() end,                  desc = 'Find files' },
    { '<leader>?',  function() require('fzf-lua').keymaps() end,                         desc = 'Find keymap' },
    { '<leader>r',  function() require('fzf-lua').resume() end,                          desc = 'Resume' },
    {
      '<leader>*',
      function() require('fzf-lua').grep_cword() end,
      desc =
        'Grep current word'
    },
  },
}
