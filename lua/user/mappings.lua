local keymap = vim.keymap.set

keymap('', '<space>', '<nop>', {})
vim.g.mapleader = ' '

keymap('n', '.', ':', {})						-- Fast command mode
keymap('n', "'", ':noh<CR>', {})				-- Remove selection
keymap('n', 'U', '<C-r>', {})					-- Fast redo
keymap('i', '<C-w>', '<esc><C-w>', {})			-- C-w in insert mode
keymap('n', '<CR>', '<C-a>', {})				-- Increment number with CR
keymap('n', '<BS>', '<C-x>', {})				-- Decrement number with BS
keymap('n', '4', '$', {})						-- Fast end-line
keymap('n', '<C-o>', ':NvimTreeToggle<CR>', {})	-- Open NvimTree
keymap('n', '<', 'za', {})						-- Toggle open fold
keymap('n', '>', 'zC', {})						-- Close fold recursive
--keymap('n', 'sadsa', 'zO', {})				-- Open fold recursive

-- Easier way to escape the terminal
keymap('t', '<Del>', '<C-\\><C-n>', {noremap = true})

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
