local nmap = require("keymap").nmap

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
        ["core.gtd.base"] = {
            config = { workspace = "tasks" }
        },
        ["core.norg.dirman"] = {
            config = {
                default_workspace = "default",
                workspaces = {
                    default = "~/Notes",
                    tasks = "~/Notes/tasks",
                    wiki = "~/Notes/wiki",
                    work = "~/Notes/work"
                }
            }
        }
    }
}

-- Mappings
nmap("<leader>nn", ":Neorg index<CR>", "Open index")
nmap("<leader>nt", ":Neorg workspace tasks<CR>", "Open tasks index")
nmap("<leader>nv", ":Neorg gtd views<CR>", "Task views")
nmap("<leader>nj", ":Neorg journal today<CR>", "Journal (today)")
nmap("<leader>nJ", ":Neorg journal yesterday<CR>", "Journal (yesterday)")
nmap("<leader>n<C-j>", ":Neorg journal tomorrow<CR>", "Journal (tomorrow)")
nmap("<leader>nc", ":Neorg gtd capture<CR>", "Capture task")
