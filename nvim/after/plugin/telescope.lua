require("telescope").setup {
    defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top"
        }
    }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
