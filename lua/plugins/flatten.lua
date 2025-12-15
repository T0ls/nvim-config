local saved_terminal

return {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        window = {
            open = "current",
        },
        hooks = {
            pre_open = function()
                local term = require("toggleterm.terminal")
                local termid = term.get_focused_id()
                saved_terminal = term.get(termid);
            end,
            post_open = function(bufnr, winnr, ft, is_blocking)
                if ft == "gitcommit" or ft == "gitrebase" then
                    vim.api.nvim_create_autocmd("BufWritePost", {
                        buffer = bufnr,
                        once = true,
                        callback = vim.schedule_wrap(function()
                            vim.api.nvim_buf_delete(bufnr, {})
                        end)
                    })
                end
            end,
            block_end = vim.schedule_wrap(function()
                if saved_terminal then
                    saved_terminal:open()
                    saved_terminal = nil
                end
            end),
        },
    }
}
