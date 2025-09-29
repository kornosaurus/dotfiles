return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false,
  opts = {
    mode = "legacy",
    instructions_file = "avante.md",
    provider = "copilot",
    providers = {},
    mappings = {
      submit = {
        normal = "<CR>",
        insert = "<C-y>",
      },
      suggestion = {
        accept = "<C-y>",
        next = "<C-]>",
        prev = "<C-[>",
        dismiss = "<C-]>",
      },
    },
    selection = {
      enabled = true,
      hint_display = "none",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
  },
}
