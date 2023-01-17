local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    vim.notify('telescope not found')
    return
end

telescope.setup({
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
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor()
        }
    }
})

telescope.load_extension('ui-select')
telescope.load_extension('fzf')
telescope.load_extension('projects')

-- Maps
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fp', ":Telescope projects<CR>")
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>")
vim.keymap.set('n', '<leader>/', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>*', ':Telescope grep_string<CR>')
