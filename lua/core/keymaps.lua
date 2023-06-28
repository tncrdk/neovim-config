local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
-- map("i", "jk", "<esc>")

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Files
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")

-- Quit
map("n", "<leader>qw", "<cmd>q<cr>", "Quit") -- window quit TODO Legg til under window management
map("n", "<leader>qs", "<cmd>wq<cr>", "Save and Quit")
map("n", "<leader>qq", "<cmd>qa!<cr>", "Quit all")

-- Diagnostic keymaps
map("n", "gx", vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Lazy
map("n", "<leader>L", require("lazy").show, "Show Lazy")

-- Easier access to beginning and end of lines
map({ "n", "v" }, "<S-h>", "^", "Go to beginning of line")
map({ "n", "v" }, "<S-l>", "$", "Go to end of line")

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', "Yank to system clipboard")
map("n", "<leader>Y", '"+Y', "Yank to system clipboard")
map({ "n", "v" }, "<leader>p", '"+p', "Paste from system clipboard")
map({ "n", "v" }, "<leader>P", '"+P', "Paste from system clipboard")

-- Don't override paste-buffer
map("x", "<leader>rp", '"_dp', "Paste without overriding paste-buffer")
map({ "n", "v" }, "<leader>rd", '"_d', "Delete without overriding paste-buffer")
map({ "n", "v" }, "<leader>rD", '"_D', "Delete without overriding paste-buffer")

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save file")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Delete current buffer")
map("n", "<leader>bo", buffers.delete_others, "Delete other buffers")
map("n", "<leader>ba", buffers.delete_all, "Delete all buffers")

-- Navigate buffers
map("n", "<S-w>", ":bnext<CR>")
map("n", "<S-b>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<S-tab>", "<gv" )
map("v", "<tab>", ">gv")

-- Use tab-keys for tab
map("n", "<tab>", "v>gv<esc>")
map("n", "<S-tab>", "v<gv<esc>")
map("i", "<S-tab>", "<C-d>")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Select everything
map("n", "<leader>a", "ggV<S-g>", "Select entire file")

-- Fuzzyfinder
local builtin = require("telescope.builtin")
map("n", "<leader>sf", builtin.find_files, "find files")
map("n", "<leader>sg", builtin.live_grep, "live grep")
map("n", "<leader>sb", builtin.buffers, "buffers")
map("n", "<leader>sh", builtin.help_tags, "help tags")
map("n", "<leader>sn", "<cmd>Telescope notify<CR>", "Notify")

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", "Toggle trouble")
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle workspace diagnostics")
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle document diagnostics")
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", "Toggle loclist")
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", "Toggle quickfix")
map("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", "Toggle LSP-references")

-- Leap
vim.keymap.set({ "n", "v" }, "f", "<Plug>(leap-forward-to)", { remap = true })
vim.keymap.set({ "n", "v" }, "F", "<Plug>(leap-backward-to)", { remap = true })

-- Undotree
map("n", "<leader>U", "<cmd>UndotreeToggle<CR>")
