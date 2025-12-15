local utils = require("utils")

return {
    "f4z3r/gruvbox-material.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
        utils.config.set(vim.g, {
            terminal_color_0  = "#000000",
            terminal_color_8  = "#767676",
            terminal_color_1  = "#cc0403",
            terminal_color_9  = "#f2201f",
            terminal_color_2  = "#19cb00",
            terminal_color_10 = "#23fd00",
            terminal_color_3  = "#cecb00",
            terminal_color_11 = "#fffd00",
            terminal_color_4  = "#0d73cc",
            terminal_color_12 = "#1a8fff",
            terminal_color_5  = "#cb1ed1",
            terminal_color_13 = "#fd28ff",
            terminal_color_6  = "#0dcdcd",
            terminal_color_14 = "#14ffff",
            terminal_color_7  = "#dddddd",
            terminal_color_15 = "#ffffff",
        })
    end,
}
