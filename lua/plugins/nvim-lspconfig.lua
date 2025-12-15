local utils = require("utils")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local lsps = {
    rust_analyzer = {
        imports = {
            granularity = "module",
            preferPrelude = true,
        },
    },
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--fallback-style=llvm",
        },
    },
    basedpyright = nil,
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    ignoreSubmodules = false,
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        },
    },
    tinymist = nil,
    gopls = nil,
    crystalline = nil,
}

local function load_lsps()
    for lsp, config in pairs(lsps) do
        vim.lsp.enable(lsp)
        if config then
            vim.lsp.config(lsp, config)
        end
    end
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {},
    keys = utils.map.get('lsp', 'lazy'),
    config = load_lsps,
}
