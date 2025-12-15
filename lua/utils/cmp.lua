local M = {}

-- Functions used to define mappings for nvim-cmp, copied from nvim-cmp
-- Mappings are defined before loading plugins,
-- we cannot use the functions in nvim-cmp

-- jump super-tab
-- jump back super-tab

function M.scroll_docs(lines)
    return function(fallback)
        local cmp = require("cmp")
        if cmp.scroll_docs(lines) then return end
        fallback()
    end
end

function M.select_next_item()
    return function(fallback)
        local cmp = require("cmp")
        if cmp.select_next_item({ behavior = cmp.SelectBehavior.Select }) then return end
        local release = cmp.core:suspend()
        fallback()
        vim.schedule(release)
    end
end

function M.select_prev_item()
    return function(fallback)
        local cmp = require("cmp")
        if cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select }) then return end
        local release = cmp.core:suspend()
        fallback()
        vim.schedule(release)
    end
end

function M.confirm()
    return function(fallback)
        local cmp = require("cmp")
        if cmp.visible() and cmp.get_active_entry() then
            if cmp.confirm({ select = false }) then return end
        end
        fallback()
    end
end

function M.super_tab()
    return function(fallback)
        local cmp, luasnip = require("cmp"), require("luasnip")
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end
end

function M.super_tab_back()
    return function(fallback)
        local cmp, luasnip = require("cmp"), require("luasnip")
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end
end

return M
