require('lualine').setup({
    options = {
        theme = 'gruvbox-material',
        component_separators = '',
        icons_enabled = true,
    },
    sections = {
        lualine_b = {
            { 'branch' },
            { 'diff', colored = false },
        },
        lualine_c = {
            {'filename'},
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                diagnostics_color = {
                    warn = { fg = '#fff000' },
                },
            },
        },
    },
    extensions = { 'quickfix', 'nvim-tree' },
})

