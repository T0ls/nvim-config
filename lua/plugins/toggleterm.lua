return {
    "akinsho/toggleterm.nvim",
    opts = {
        open_mapping = require("config.mappings").terminal_open, -- FIXME: key
        autochdir = true,
        size = 20, 
        
        direction = 'float',
        
        float_opts = { 
            border = 'curved',
            width = 145,
            height = 31,
        }
    }
}
