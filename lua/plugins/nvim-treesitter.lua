return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    build = ":TSUpdate",
    config = function(_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)

        local rainbow_delimiters = require("rainbow-delimiters")
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                "rainbowcol1",
                "rainbowcol2",
                "rainbowcol3",
                "rainbowcol4",
                "rainbowcol5",
                "rainbowcol6",
                "rainbowcol7",
            },
        }
    end,
    opts = {
        ensure_installed = {
            "c", "cpp",
            "rust", "toml",
            "vim", "lua", "vimdoc",
            "html", "css", "javascript",
            "gitcommit", "gitignore", "git_rebase",
            "bash", "make",
            "sql",
            "yuck",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    }
}
