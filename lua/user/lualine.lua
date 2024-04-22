local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local filetype = {
	'filetype',
	icons_enabled = false,
	icon = nil
}

local location = function ()
	return '%l %2v'
end

local indent = function()
	local get = function(name) return vim.api.nvim_buf_get_option(0, name) end
	local out
	if get 'expandtab' then
		out = 'spaces: '
	else
		out = 'tabs: '
	end
	return out .. get 'shiftwidth'
end

vim.cmd 'highlight LualineSignError ctermfg=167 ctermbg=236 guifg=#ea6962 guibg=#3a3735'
vim.cmd 'highlight LualineSignWarn ctermfg=214 ctermbg=236 guifg=#d8a657 guibg=#3a3735'

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn' },
	symbols = { error = '', warn = '' },
	update_in_insert = false,
	diagnostics_color = {
		error = 'LualineSignError',
		warn = 'LualineSignWarn'
	}
}

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox-material',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = { diagnostics },
		lualine_x = { location },
		lualine_y = { filetype, indent },
		lualine_z = { 'progress' }
	}
}
