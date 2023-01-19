local keymap = vim.keymap.set

local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
    return
end

keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {})
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {})
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {})
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
               ['<C-k>'] = actions.move_selection_previous,
               ['<C-j>'] = actions.move_selection_next,
            } 
        }
    } 
})
