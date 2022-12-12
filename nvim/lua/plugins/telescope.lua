local nmap = require("keymap").nmap
local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    vim.notify('telescope not found')
    return
end

telescope.setup {
    defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        -- layout_strategy = "horizontal",
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            mirror = true,
            vertical = {
                width = 0.9,
                height = 0.9,
                preview_height = 0.6,
                preview_cutoff = 0
            }
        }
    }
}

telescope.load_extension('ui-select')
telescope.load_extension('fzf')

-- Maps
nmap('<leader>ff', ":Telescope find_files<CR>")
nmap('<leader>fb', ":Telescope buffers<CR>")
nmap('<leader>gs', ":Telescope git_status<CR>")
nmap('<leader>/', ':Telescope live_grep<CR>', nil, { noremap=true })
nmap('<leader>*', ':Telescope grep_string<CR>', nil, { noremap=true })
