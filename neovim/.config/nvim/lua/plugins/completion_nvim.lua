--- Keybindings

Keybind.g({
	{ 'i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, silent = true } },
	{ 'i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, silent = true } },
})