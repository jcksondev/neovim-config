vim.g.mapleader = ' '

local keymap = vim.keymap.set

-- Normal
keymap('n', '<leader>nh', ':nohl<CR>')

keymap('n', 'k', 'kzz')
keymap('n', 'j', 'jzz')

keymap('n', '<leader>w', ':w<CR>')
keymap('n', '<leader>q', ':wq<CR>')

keymap('n', '<leader>e', ':NvimTreeToggle<CR>')

keymap('n', '<leader>sv', '<C-w>v')
keymap('n', '<leader>sh', '<C-w>s')
keymap('n', '<leader>se', '<C-w>=')
keymap('n', '<leader>sx', ':close<CR>')

keymap('n', '<leader>to', ':tabnew<CR>')
keymap('n', '<leader>tx', ':tabclose<CR>')
keymap('n', '<leader>tn', ':tabn<CR>')
keymap('n', '<leader>tp', ':tabp<CR>')

keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-l>', '<C-w>l')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')

-- Insert
keymap('i', 'jk', '<Esc>')
keymap('i', 'kj', '<Esc>')


-- Visual
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

keymap('v', 'p', '"_dP')
