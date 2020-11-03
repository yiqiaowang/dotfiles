require('nvim_utils')
require('mappings')

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
  vim.g.python3_host_prog = '/usr/local/bin/python3'

  local autocmds = {
    load_core = {};
    ft = {};
    windows = {};
    bufs = {};
    ft_detect = {};
  }
  nvim_create_augroups(autocmds)
end

local function create_commands()
end

core_options()
create_commands()
