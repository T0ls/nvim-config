---@type LazySpec
return {
    "goolord/alpha-nvim",
    config = function()
        require("alpha").setup(require("alpha.themes.dashboard").config)
    end
}

-- actions:
--  open a project
--      list recent projects
--  scratch
--  open neotree fullscreen
--  quit
