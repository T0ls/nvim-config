local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

local ok_rainbow, rainbow_delimiters = pcall(require, 'rainbow-delimiters')
if not ok_rainbow then
	return
end

treesitter.setup {

	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "html", "javascript", "css", "go" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 300 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	autotag = {
		enable = true,
	}
}

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
		'RainbowLevel0',
		'RainbowLevel1',
		'RainbowLevel2',
		'RainbowLevel3',
		'RainbowLevel4',
		'RainbowLevel5',
		'RainbowLevel6',
		'RainbowLevel7',
		'RainbowLevel8',
    },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true



--[[
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	enure_installed = { 'bash', 'c', 'cpp', 'glsl', 'html', 'javascript', 'css', 'make', 'lua', 'rust', 'java' },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		hlgroups = {
			'RainbowLevel0',
			'RainbowLevel1',
			'RainbowLevel2',
			'RainbowLevel3',
			'RainbowLevel4',
			'RainbowLevel5',
			'RainbowLevel6',
			'RainbowLevel7',
			'RainbowLevel8',
		}
	}
}

-- Create folds based on treesitter's ast
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
})
--]]
