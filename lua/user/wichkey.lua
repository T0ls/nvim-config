local ok, whichkey = pcall(require, 'which-key')
if not ok then
	return
end

whichkey.setup({
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
})
