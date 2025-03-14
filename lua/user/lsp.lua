local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
	return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
	return
end
cmptypes = require 'cmp.types'

local cmp_lsp_ok, cmplsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_ok then
	return
end

local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
	return
end

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = function(mode, key, action, in_opts)
		vim.api.nvim_buf_set_keymap(bufnr, mode, key, action, in_opts)
	end

	keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declarations()<CR>', opts)
	keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	keymap('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {silent = true})
	keymap('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', {silent = true})
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

	vim.api.nvim_exec([[
    augroup lsp_document_highlight
    	autocmd! * <buffer>
    	autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    	autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
	]], false)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmplsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local default_servers = { 'gopls', 'html', 'cssls', 'ts_ls', "pylsp", "clangd"}
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

local kind_icons = {
	Text = "󰦨",
	Method = "",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = {
		['<A-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
		['<A-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
		['<Down>'] = cmp.mapping({
			i = cmp.mapping.select_next_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
			c = function(fallback)
				cmp.close()
				vim.schedule(cmp.suspend())
				fallback()
			end
		}),
		['<Up>'] = cmp.mapping({
			i = cmp.mapping.select_prev_item({ behavior = cmptypes.cmp.SelectBehavior.Select }),
			c = function(fallback)
				cmp.close()
				vim.schedule(cmp.suspend())
				fallback()
			end
		}),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close()
		},
		['<CR>'] = cmp.mapping.confirm { select = true },
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' })
	},
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				luasnip = '[Snip]',
				buffer = '[Buffer]',
				path = '[Path]'
			})[entry.source.name]
			return vim_item
		end
	},
	sources = { 
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' }, 
		{ name = 'buffer' } 
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		}
	},
	experimental = {
		ghost_text = false,
		native_menu = false
	}
}
