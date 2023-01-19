local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap.set

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)                -- show definition, references
    keymap('n', 'gD', vim.lsp.buf.declaration, opts)                            -- goto declaration
    keymap('n', 'gd', '<cmd>Telescope lsp_definition<CR>', opts)                -- see definition and make edits in window
    keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)           -- goto word implementation under cursor
    keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)          -- goto type definition under cursor
    keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)           -- see available code actions
    keymap('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)    -- show diagnostics for file
    keymap('n', '<leader>d', vim.diagnostic.open_float, opts)                   -- show diagnostics for line
    keymap('n', '[d', vim.diagnostic.goto_prev, opts)                           -- jump to previous diagnostic in buffer
    keymap('n', ']d', vim.diagnostic.goto_next, opts)                           -- jump to next diagnostic in buffer
    keymap('n', 'K', vim.lsp.buf.hover, opts)                                   -- show documentation under cursor
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config')] = true,
                },
            },
        },
    },
})
