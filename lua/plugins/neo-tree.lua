local utils = require("utils")
---@module "neo-tree"

---@type LazySpec
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    ---@type neotree.Config
    opts = {
        window = {
            mappings = utils.map.get("neo-tree.window", "neo-tree"),
        },

        filesystem = {
            mappings = utils.map.get("neo-tree.filesystem", "neo-tree"),
            filtered_items = {
                always_show = { ".gitignore", ".local" },
            },
            use_libuv_file_watcher = true,
        },
    }
}
