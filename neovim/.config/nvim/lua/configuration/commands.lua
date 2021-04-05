Command.cmd({
    'filetype plugin on',
})

Augroup.cmds({
    -- highlight on yank
    highlight_yank = {
        {"TextYankPost", "* silent! lua require'vim.highlight'.on_yank({timeout = 400})"};
    };
    -- trim whitespace on save
    trim_whitespace = {
        {"BufWritePre", "* :call TrimWhitespace()"};
    };
})