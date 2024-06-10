local ok1, indent = pcall(require, 'ibl')
if not ok1 then
    return
end

vim.cmd 'highlight IblScopeHighlight guifg=#8f8f8f'

indent.setup {
    indent = { char = '' },
    scope = {
        show_end = false,
        highlight = "IblScopeHighlight"
    },
}
