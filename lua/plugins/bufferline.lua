---@type LazySpec
return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        ---@type bufferline.Options
        options = {
            separator_style = "slant",
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Files",
                    highlight = "Directory",
                    separator = true,
                },
            },
        }
    }
}
