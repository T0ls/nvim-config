vim.cmd "colorscheme gruvbox-material"

local configs = {
	termguicolors = true,
	tabstop = 4,
	shiftwidth = 4,
	showmode = false,
	number = true,
	cursorline = true,
	smartindent = false,
	wrap = false,
	showtabline = 1,
	background = 'dark',
	updatetime = 1000,
	relativenumber = true,
	ignorecase = true,
	smartcase = true
}

for k, v in pairs(configs) do
	vim.opt[k] = v
end
