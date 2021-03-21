Command.cmd({
    'filetype plugin on',
})

Augroup.cmds({
    -- highlight on yank
    highlight_yank = {
        {"TextYankPost", "* silent! lua require'vim.highlight'.on_yank({timeout = 400})"};
    };
    -- its PROPERTY!!!
    MTHNGLAC = {
        {"BufWritePre", "* :call TrimWhitespace()"};
    };
    -- completion nvim
    completion_nvim = {
        {"BufEnter", "*", "lua require'completion'.on_attach()"};
    };

})