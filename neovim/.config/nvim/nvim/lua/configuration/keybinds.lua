Keybind.g({
	--[[
	#-------------------------------------------------------------------------#
	#                                    CONFIG                               #
	#-------------------------------------------------------------------------#
	--]]
    -- reload nvim configuration file
    { 'n', '<Leader><CR>', ':luafile $MYVIMRC<CR>' },
    
	--[[
	#-------------------------------------------------------------------------#
	#                                MOVE LINE                                #
	#-------------------------------------------------------------------------#
	--]]

    -- move selected line to up/down
    { 'v', 'J', '<Cmd>m \'>+1<CR>gv=gv', { noremap = true } },
    { 'v', 'K', '<Cmd>m \'<-2<CR>gv=gv', { noremap = true } },
})



Keybind.g({
	--[[
	#-------------------------------------------------------------------------#
	#                                   OTHER                                 #
	#-------------------------------------------------------------------------#
	--]]
    -- hit twice the spacebar if you want highlight to gone!
    { 'n', '<Leader>', '<Cmd>nohlsearch<Bar>:echo<CR>', { noremap = true, silent = true } },
    -- ctrl-c
    { 'i', '<C-c>', '<esc>', { noremap = true } },
    -- Yanking more consistent
    { 'n', 'Y', 'y$', {noremap = true} },
    -- quick buffer switch
    { 'n', '<bs>', '<c-^>', {noremap = true} }
})