local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = '<C-a>',
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = 'float',
	shell = vim.o.shell,
	float_opts = {
		border = 'curved',
		winblend = 0,
		highlights = {
			border = 'Normal',
			background = 'Normal'
		}
	}
})

-- Set terminal colors
vim.g.terminal_color_0 = '#000000'
vim.g.terminal_color_1 = '#CC0403'
vim.g.terminal_color_2 = '#19CB00'
vim.g.terminal_color_3 = '#CECB00'
vim.g.terminal_color_4 = '#0D73CC'
vim.g.terminal_color_5 = '#CB1ED1'
vim.g.terminal_color_6 = '#0DCDCD'
vim.g.terminal_color_7 = '#DDDDDD'
vim.g.terminal_color_8 = '#767676'
vim.g.terminal_color_9 = '#F2201F'
vim.g.terminal_color_10 ='#23FD00'
vim.g.terminal_color_11 ='#FFFD00'
vim.g.terminal_color_12 ='#1A8FFF'
vim.g.terminal_color_13 ='#FD28FF'
vim.g.terminal_color_14 ='#14FFFF'
vim.g.terminal_color_15 ='#FFFFFF'
