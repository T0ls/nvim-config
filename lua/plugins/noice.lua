return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        messages = {
            view = "mini",
        },
        presets = {
            bottom_search = true,
        },
        redirect = {
            view = "notify",
        },
    },
    config = function(_, opts)
        local noice = require("noice")
        noice.setup(opts)
    end
}
