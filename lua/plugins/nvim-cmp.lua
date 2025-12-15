local utils = require("utils")

local function should_enable()
    if vim.api.nvim_get_mode == "c" then
        return true
    end

    local recording = vim.fn.reg_recording() ~= ""
    if recording then return false end

    local executing = vim.fn.reg_executing() ~= ""
    if executing then return false end

    local ctx = require("cmp.config.context")
    local in_comment = ctx.in_treesitter_capture("comment")
    in_comment = in_comment or ctx.in_syntax_group("Comment")

    return true
    --return not in_comment
end

local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

local source_text = {
    nvim_lsp = "",
    nvim_lua = "",
    luasnip = "",
    path = "",
    buffer = "󰦪",
}

local function config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
        enabled = should_enable,
        preselect = cmp.PreselectMode.None,
        mapping = utils.map.get("nvim-cmp", "nvim-cmp"),
        snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry,  vim_item)
                vim_item.kind = kind_icons[vim_item.kind]
                vim_item.menu = source_text[entry.source.name]
                return vim_item
            end
        },
        sorting = {
            priority_weight = 3,
        },
        sources = {
            {
                name = "lazydev",
                group_index = 0,
            },
            {
                name = "nvim_lsp",
                group_index = 1,
            },
            {
                name = "nvim_lua",
                group_index = 2,
            },
            {
                name = "luasnip",
                group_index = 3,
            },
            {
                name = "path",
                group_index = 4,
            },
            {
                name = "buffer",
                group_index = 5,
                option = {
                    keyword_pattern = [[\[a-zA-Z_À-ÿ]\(\w|\[À-ÿ]\)*\|0x\[a-fA-F0-9_]\+\|0b\[01_]\+]],
                }
            },
        },
        confirmation = {
            default_behavior = cmp.ConfirmBehavior.Replace,
        },
        experimental = {
            ghost_text = true,
        },
    })
end

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
        },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        --"hrsh7th/cmp-cmdline", TODO
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = { "lazy.nvim", "bufferline.nvim" },
            },
        },
    },
    config = config,
}
