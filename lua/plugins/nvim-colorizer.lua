return {
    "norcalli/nvim-colorizer.lua",
    opts = {
        default = {
            RRGGBBAA = true,
            names = false,
        },
        files = {
            "*",
            "!toggleterm",
            css = { names = true, rgb_fn = true, hsl_fn = true },
            html = { names = true, rgb_fn = true, hsl_fn = true },
        },
    },
    config = function(_, opts)
        require("colorizer").setup(opts.files, opts.default)
    end,
}
