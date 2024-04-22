local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"sainnhe/gruvbox-material",
	"akinsho/toggleterm.nvim",
	--"folke/which-key.nvim",
	"windwp/nvim-autopairs",
	"nvim-tree/nvim-tree.lua",
	
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"nvim-lualine/lualine.nvim",
	"norcalli/nvim-colorizer.lua",
	"nvim-treesitter/nvim-treesitter",
	"hiphish/rainbow-delimiters.nvim",
	"windwp/nvim-ts-autotag",
	--	"ur4ltz/surround.nvim"
	--	"nvim-telescope/telescope.nvim"
})
local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
	return
end

autopairs.setup()
