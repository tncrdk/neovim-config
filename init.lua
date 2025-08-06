-- Function for remapping keys
-- Global variable that can be used in all the other files
Map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Set leader key to be <space>
vim.g.mapleader = " "
Map({ "n", "v" }, " ", "<nop>")

-- Set local leader key to be '-'
vim.g.maplocalleader = "-"

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
