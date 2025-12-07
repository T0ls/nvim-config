local keymap = vim.keymap.set

keymap('', '<space>', '<nop>', {})
vim.g.mapleader = ' '

keymap('n', '.', ':', {})						-- fast command mode
keymap('n', "'", ':noh<CR>', {})				-- remove selection
keymap('n', 'U', '<C-r>', {})					-- fast redo
keymap('i', '<C-w>', '<esc><C-w>', {})			-- C-w in insert mode
keymap('n', '<CR>', '<C-a>', {})				-- Increment number with CR
keymap('n', '<BS>', '<C-x>', {})				-- Decrement number with BS
keymap('n', '<C-o>', ':NvimTreeToggle<CR>', {})	-- Open NvimTree
keymap('n', '4', '$', {})						-- fast end-line
keymap('n', '<TAB>', '<C-o>', {})				-- fast back-to-line
keymap('n', '<S-TAB>', '<C-i>', {})				-- fast redo-to-line

-- Easier way to escape the terminal
keymap('t', '<Del>', '<C-\\><C-n>', {noremap = true})

local ok, pickers = pcall(require, "telescope.builtin")
if ok then
	function find_files()
		pickers.find_files {
			find_command = {
				'find',
				'-type', 'f',
				'-maxdepth', '5',
				'-not', '-path', '*/node_modules/*',
			}
		}
	end
	
	function git_or_files()
		local commit_count = tonumber(vim.fn.system('git rev-list --all --count'))
		if vim.v.shell_error == 0 then
			if commit_count ~= 0 and commit_count ~= nil then
				pickers.git_files()
			else
				vim.print 'No commits in git repository, falling back to file view'
				find_files()
			end
		else
			vim.print 'Not inside a git repository, falling back to file view'
			find_files()
		end
	end


	keymap('n', '<leader>f', git_or_files, {})
	keymap('n', '<leader>g', pickers.live_grep, {})
end

keymap({'n','v', 'i'}, '<Left>', function() print("NOP") end)
keymap({'n','v', 'i'}, '<Right>', function() print("NOP") end)
keymap({'n','v', 'i'}, '<Up>', function() print("NOP") end)
keymap({'n','v', 'i'}, '<Down>', function() print("NOP") end)
--[[
keymap('n', '<Up>', '<Nop>', {noremap = true})
keymap('n', '<Down>', '<Nop>', {noremap = true})
keymap('n', '<Left>', '<Nop>', {noremap = true})
keymap('n', '<Right>', '<Nop>', {noremap = true})
keymap('i', '<Up>', '<Nop>', {noremap = true})
keymap('i', '<Down>', '<Nop>', {noremap = true})
keymap('i', '<Left>', '<Nop>', {noremap = true})
keymap('i', '<Right>', '<Nop>', {noremap = true})
keymap('i', '<Del>', '<Nop>', {noremap = true})
--]]
