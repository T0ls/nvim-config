local utils = require("utils")

local neovide = vim.g.neovide

utils.config.set(vim.opt, {
    mouse = "a",
    mousemodel = "extend",

    updatetime = 1000,
    ignorecase = true,  -- Required to make smartcase work
    smartcase = true,
    magic = false,      -- This might break some plugins
    swapfile = false,
    undofile = true,

    tabstop = 4,
    softtabstop = 0,
    shiftwidth = 4,
    expandtab = true,
    wrap = false,

    termguicolors = true,
    number = true,
    relativenumber = true,
    cursorline = true,
    background = "dark",
    scrolloff = 999,
    laststatus = 3,
    fillchars = { {eob = " "}, append = true },
    listchars = { {trail = "~"}, append = true },
    showcmdloc = "statusline",
    showmode = false,

    guifont = { "Maple Mono NF CF:h12", enable = neovide }
})

utils.config.set(vim.g, {
    neovide_padding_top = { 0, enable = neovide },
    neovide_padding_bottom = { 0, enable = neovide },
    neovide_padding_right = { 0, enable = neovide },
    neovide_padding_left = { 0, enable = neovide },
    neovide_scroll_animation_length = { 0, enable = neovide },
})

utils.map.load("global")
if neovide then
    utils.map.load("neovide")
end
