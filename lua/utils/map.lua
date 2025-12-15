local M = {}

---@type { [string]: utils.Keymap[] }
local keymaps = {}

---@type { [string]: utils.Keymap[] }
local plugin_keymaps = {}

---@alias utils.KeymapOpt "remap"|"nowait"|"buf"|"silent"|"expr"

---@class utils.Keymap
---@field [1] string key
---@field [2] string|string[] mode
---@field [3] any action
---@field [4]? utils.KeymapOpt[] opts

--- Save keymaps under name, with default options
---@param name string
---@param default utils.KeymapOpt[]
---@param keys utils.Keymap[]
function M.set(name, default, keys)
    for _, val in ipairs(keys) do
        val[4] = val[4] or default
    end

    keymaps[name] = keys
end

---@param opts utils.KeymapOpt[]?
---@return vim.keymap.set.Opts
local function opts_convert(opts)
    if opts == nil then
        return {}
    end
    ---@type vim.keymap.set.Opts
    local res = {}
    for _, opt in ipairs(opts) do
        if opt == "buf" then
            res.buffer = true
        elseif opt == "nowait" then
            res.nowait = true
        elseif opt == "remap" then
            res.remap = true
        elseif opt == "silent" then
            res.silent = true
        elseif opt == "expr" then
            res.expr = true
        end
    end
    return res
end

---@param map utils.Keymap
local function lazy_conv(map)
    local key = map[1]
    local mode = map[2]
    local action = map[3]
    local opts = opts_convert(map[4])

    local res = { key, action, mode = mode }
    res = vim.tbl_extend("force", res, opts)
    return res
end

---@param map utils.Keymap
local function neotree_conv(map)
    local action = map[3]
    local opts = opts_convert(map[4])

    opts.buffer = nil
    local res = action
    if next(opts) ~= nil then
        if type(action) == "string" then
            res = opts
            res[1] = action
        else
            res = vim.tbl_extend("force", res, opts)
        end
    end
    return res
end

---@param map utils.Keymap
local function nvim_cmp_conv(map)
    local cmp = require("cmp")

    local mode = map[2]
    local action = map[3]

    local modes
    if type(mode) == "table" then
        modes = mode
    else
        modes = {}
        for i = 1, #mode do
            modes[#modes + 1] = mode:sub(i, i)
        end
    end

    -- key -> cmp.mapping({mode = func}) -- TODO: fix this format
    return cmp.mapping(action, modes)
end

---@param name string
---@param format "neo-tree"|"lazy"|"nvim-cmp"
function M.get(name, format)
    ---@type utils.Keymap[]
    local maps = keymaps[name]
    if maps == nil then
        vim.notify(
            "Keymaps[".. name .. "]: Cannot load: not defined",
            vim.log.levels.ERROR
        )
        return
    end

    local res = {}
    for _, val in ipairs(maps) do
        local key = val[1]

        if format == "lazy" then
            res[#res + 1] = lazy_conv(val)
        elseif format == "neo-tree" then
            res[key] = neotree_conv(val)
        elseif format == "nvim-cmp" then
            res[key] = nvim_cmp_conv(val)
        end
    end
    return res
end

function M.load(name)
    local maps = keymaps[name]
    if maps == nil then
        vim.notify(
            "Keymaps[".. name .. "]: Cannot load: not defined",
            vim.log.levels.ERROR
        )
        return
    end

    for _, val in pairs(maps) do
        local key = val[1]
        local mode = val[2]
        local action = val[3]
        local opts = opts_convert(val[4])
        vim.keymap.set(mode, key, action, opts)
    end
end

return M
