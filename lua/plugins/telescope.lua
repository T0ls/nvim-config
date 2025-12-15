local utils = require("utils")

return {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
                "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    keys = utils.map.get("telescope", "lazy"),
    cmd = "Telescope",
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            layout_config = {
                horizontal = {
                    preview_width = 0.55,
                    results_width = 0.8,
                },
            },
            file_ignore_patterns = { ".git/", "node_modules" },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
            },
        },
    }
}
