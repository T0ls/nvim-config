local utils = require("utils")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local lsps = {
    html = nil,
    gopls = nil,
    cssls = nil,
    ts_ls = nil,
    pylsp = nil,
    clangd = nil,
    sqlls = nil,
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
