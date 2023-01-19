local cmp = require('cmp')

require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = '#D5D8DA', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#E95678', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#B877DB', bg = 'NONE' })

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),        -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor'
        }
    },
})
