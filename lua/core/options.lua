local opt = vim.opt

opt.autowrite = true           -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.conceallevel = 0
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hlsearch = false
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.incsearch = true
opt.laststatus = 0
opt.list = true       -- Show some invisible characters (tabs...
opt.mouse = "a"       -- Enable mouse mode
opt.number = true
opt.pumblend = 10     -- Popup blend
opt.pumheight = 10    -- Maximum number of entries in a popup
opt.relativenumber = true
opt.scrolloff = 8     -- Lines of context,
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false   -- Dont show mode since we have a statusline
opt.sidescrolloff = 8  -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn otherwise it would shift the text each time
opt.smartcase = true   -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = "en"
opt.splitbelow = true  -- Put new windows below current
opt.splitright = true  -- Put new windows right of current
opt.tabstop = 4
opt.termguicolors = true
opt.textwidth = 80
opt.timeoutlen = 500 -- Timout of keycombinations. Which-key appears after the timeout. Needs to be high enough for vim-surround binding as it is one binding
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winborder = 'rounded'
opt.winminwidth = 5                -- Minimum window width,
opt.wrap = false

-- nvim-navic window bar
-- vim.o.winbar = "|> %{%v:lua.require'nvim-navic'.get_location()%}"

-- UndoTree
-- vim.o.swapfile = false
-- vim.o.backup = false
-- vim.o.undofile = true
-- vim.o.undodir = vim.fn.expand("~/.cache/nvim/undodir")

-- Set colorscheme
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)


-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Set tabsize to 2 when working with R-files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "r",
	command = "setlocal shiftwidth=2 tabstop=2"
})
