return {
    "akinsho/toggleterm.nvim",
    opts = {
        open_mapping = require("config.mappings").terminal_open, -- FIXME: key
        autochdir = true,
        direction = 'float',
        float_opts = { border = 'curved' }
    }
}
