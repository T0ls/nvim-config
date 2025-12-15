local map = require("utils").map
local cmp = require("utils").cmp

vim.g.mapleader = " "

map.set("global", {}, {
    -- Normal
    { ".", "n", ":" },                  -- Easier command mode
    { "<S-u>", "n", "<C-r>" },          -- Easier redo
    { "<CR>", "n", "<C-a>" },           -- Easier increment
    { "<BS>", "n", "<C-x>" },           -- Easier decrement
    { "<S-a>", "n",
        function() return vim.bo.modifiable and "<S-a>" or "$" end,
        { "expr" }
    },                                  -- <S-a> Goes to the end of line in unmodifiable buffers
    { "<C-S-o>", "n", function()
        local curbuf = vim.api.nvim_win_get_buf(0)
        vim.cmd("bp")
        local prevbuf = vim.api.nvim_win_get_buf(0)
        if curbuf ~= prevbuf then
            vim.api.nvim_buf_delete(curbuf, {})
        end
    end },                              -- Go to previous buffer and delete
    -- Insert
    { "<C-w>", "i", "<esc><C-w>" },     -- <C-w> in insert mode
    -- Terminal
    { "<Del>", "t", "<C-\\><C-n>" },    -- Easier escape from terminal
    -- Visual
    { ">", "v", ">gv" },                -- Keep visual when changing indent
    { "<", "v", "<gv" },                -- Keep visual when changing indent

    --  Neotree
    { "<leader>f", "n", "<cmd>Neotree focus<CR>" }  -- Open neotree
})

-- Disable partial write
-- Copied from: https://vi.stackexchange.com/questions/16732/avoid-write-partial-file
vim.cmd([[cabbrev <expr> w getcmdtype()==':' && getcmdline() == "'<,'>w" ? '<c-u>w' : 'w']])

map.set("neovide", {}, {
    { "<CS-c>", "v", "\"+ygv" },            -- Copy in neovide
    { "<CS-v>", "i", "<Esc>\"+p`]i" },      -- Paste in neovide (Insert)
    { "<CS-v>", "t", "<C-\\><C-n>\"+pi" },  -- Paste in neovide (Terminal)
})

local function jump_next_diag() vim.diagnostic.jump({count=1, float=true}) end
local function jump_prev_diag() vim.diagnostic.jump({count=1, float=true}) end

map.set("lsp", { "buf" }, {
    { "gd", "n", vim.lsp.buf.definition },           -- Go to definition
    { "gD", "n", vim.lsp.buf.declaration },          -- Go to declaration
    { "gi", "n", vim.lsp.buf.implementation },       -- Go to implementation
    { "gT", "n", vim.lsp.buf.type_definition },      -- Go to type definition
    { "gr", "n", vim.lsp.buf.references },           -- Go to references
    { "g[", "n", jump_next_diag },                   -- Go to next error
    { "g]", "n", jump_prev_diag },                   -- Go to previous error
    { "<leader>r", "n", vim.lsp.buf.rename },        -- Rename symbol
    { "<leader>a", "n", vim.lsp.buf.code_action },   -- Run code action
})

map.set("nvim-cmp", {}, {
    { "<A-j>", "is", cmp.scroll_docs(1) },
    { "<A-k>", "is", cmp.scroll_docs(-1) },
    { "<Down>", "is", cmp.select_next_item() },
    { "<Up>", "is", cmp.select_prev_item() },
    { "<CR>", "is", cmp.confirm() },
    { "<Tab>", "is", cmp.super_tab() },
    { "<S-Tab>", "is", cmp.super_tab_back() },
})

map.set("neo-tree.window", { "nowait" }, {
    { "<2-LeftMouse>", "", "open" },
    { "<cr>", "", "open" },
    { "v", "", "open_vsplit" },
    { "n", "", "open_split" },

    { "<space>", "", "toggle_node" },

    { "a", "", "add" },
    { "A", "", "add_directory" },
    { "d", "", "cut_to_clipboard" },
    { "y", "", "copy_to_clipboard" },
    { "p", "", "paste_from_clipboard" },
    { "x", "", "delete" },
    { "r", "", "rename" },
    { "q", "", "close_window" },
})

map.set("neo-tree.filesystem", { "nowait" }, {
    { "h", "", "toggle_hidden" },
    { "<bs>", "", "navigate_up" },
    { ".", "", "set_root" },
})

return { terminal_open = "<C-a>" }
