require("telescope").setup {
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
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
