local M = {}

---@param where table The vim metatable to write to
---@param config table The list of configs
function M.set(where, config)
    for k, v in pairs(config) do
        local enable = true
        local append = false
        local cfg

        if type(v) == "table" then
            cfg = v[1]
            if v[append] then append = true end
            if v[enable] ~= nil then
                enable = type(enable) == "function" and enable() or enable
            end
        else
            cfg = v
        end

        if not enable then
            return
        end

        if append then
            where[k]:append(cfg)
        else
            where[k] = cfg
        end
    end
end

return M
