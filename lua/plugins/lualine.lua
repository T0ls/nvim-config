local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = "", warn = "" }
}

local filename = {
    "filename",
    newfile_status = true,
    symbols = {
        modified = "",
        readonly = "",
        unnamed = "",
        newfile = "",
    },
}

local function location()
    return '%l:%c'
end

local function partialcmd()
    return "%S"
end

local recording = {
    require("noice").api.statusline.mode.get,
    cond = require("noice").api.statusline.mode.has,
    color = { fg = "#d3869b", gui = "bold" } -- purple color taken from gruvbox-material
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'gruvbox-material',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''}
        },
        sections = {
            lualine_a = { filename },
            lualine_b = { diagnostics },
            lualine_c = { recording, partialcmd },

            lualine_x = { location },
            lualine_y = { "filetype" },
            lualine_z = { "branch" },
        },
    }
}
