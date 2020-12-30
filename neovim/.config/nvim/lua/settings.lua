require('nvim_utils')

local function core_options()
  local options = {
    hidden          = true;
    secure          = true;
    title           = true;
    lazyredraw      = true;
    splitright      = true;
    splitbelow      = true;
    wildignorecase  = true;
    expandtab       = true;
    shiftround      = true;
    ignorecase      = true;
    smartcase       = true;
    undofile        = true;
    magic           = true;
    nobackup        = true;
    nowritebackup   = true;


    ttimeoutlen     = 20;
    shiftwidth      = 4;
    softtabstop     = 4;
    tabstop         = 8;
    cmdheight       = 2;

    mouse           = "nv";
    inccommand      = "split";
    shortmess       = vim.o.shortmess .. "cs"; 
    rtp             = vim.o.rtp .. "/usr/local/opt/fzf";
    clipboard       = "unnamedplus";
    completeopt     = "menuone,noinsert,noselect";
    

    -- UI OPTS
    termguicolors  = true;
    nowrap         = true;
    cursorline     = true;
    number         = true;
    pumblend       = 20;
    pumheight      = 15;
    scrolloff      = 1;
    sidescrolloff  = 5;
    display        = "lastline";
    guicursor      = "n:blinkwait60-blinkon175-blinkoff175,i-ci-ve:ver25";
  }

  set_options(options)

  -- Globals
  vim.g.python3_host_prog = '/usr/local/opt/python@3.8/bin/python3'

  local autocmds = {
    all_bufs = {
        {"BufEnter", "*", "lua require'completion'.on_attach()"};
    };
  }
  nvim_create_augroups(autocmds)
end

local function create_commands()
    -- Make Y more consistent
    vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

    -- telescope.nvim
    vim.api.nvim_set_keymap('n', '<leader>fb', [[:lua require('telescope.builtin').buffers()<cr>]], {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>fg', [[:lua require('telescope.builtin').live_grep()<cr>]], {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>ff', [[:lua require('telescope.builtin').find_files()<cr>]], {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>fh', [[:lua require('telescope.builtin').oldfiles()<cr>]], {noremap = true})

    vim.api.nvim_set_keymap('n', '<bs>', '<c-^>', {noremap = true})

    -- completion-nvim
    vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap = true, expr = true})
    vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})

    -- vim-vsnip
    vim.api.nvim_set_keymap('i', '<C-j>', [[vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"]], {expr = true})
    vim.api.nvim_set_keymap('i', '<C-k>', [[vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"]], {expr = true})
end

local function configure_lsp()
    local lspconfig = require'lspconfig'
    lspconfig.clangd.setup{}
end


local function configure_lsp()
    local lspconfig = require'lspconfig'
    lspconfig.clangd.setup{}
    lspconfig.pyls.setup{}
end


local function configure_treesitter()
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
end

core_options()
create_commands()
configure_lsp()
configure_treesitter()
