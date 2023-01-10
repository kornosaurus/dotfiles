-- Setup
require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.journal"] = {
            config = { workspace = "work" }
        },
        ["core.norg.concealer"] = {
            config = { icon_preset = "diamond" }
        },
        ["core.norg.completion"] = {
            config = { engine = "nvim-cmp" }
        },
        ["core.norg.dirman"] = {
            config = {
                default_workspace = "default",
                workspaces = {
                    default = "~/Notes",
                    wiki = "~/Notes/wiki",
                    work = "~/Notes/work"
                }
            }
        }
    }
}

-- Mappings
vim.keymap.set('n', "<leader>nn", ":Neorg index<CR>", {desc = "Open index"})
vim.keymap.set('n', "<leader>nt", ":Neorg workspace tasks<CR>", { desc = "Open tasks index" })
vim.keymap.set('n', "<leader>nj", ":Neorg journal today<CR>", {desc = "Journal (today)"})
vim.keymap.set('n', "<leader>nJ", ":Neorg journal yesterday<CR>", {desc = "Journal (yesterday)"})
vim.keymap.set('n', "<leader>n<C-j>", ":Neorg journal tomorrow<CR>", {desc = "Journal (tomorrow)"})
