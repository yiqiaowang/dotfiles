vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true}) -- Make Y more consistent

vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':GitFiles<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>h', ':History<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<bs>', '<c-^>', {noremap = true})
