-- Function for remapping keys
-- Global variable that can be used in all the other files
Map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Function for setting leader key
local set_leader = function(key)
    vim.g.mapleader = key
    vim.g.maplocalleader = key
    Map({ "n", "v" }, key, "<nop>")
end

-- Set leader key to be <space>
set_leader(" ")

-- Init Lazy
require("core.lazy")

-- Set options
require("core.options")

-- Set general keymaps
require("core.keymaps")

-- Configure lsp
require("core.lsp")

-- Configure autocommands
require("core.autocmds")
