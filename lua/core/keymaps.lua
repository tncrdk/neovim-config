-- KEYMAPS

-- Blazingly fast way out of insert mode
-- map("i", "jk", "<esc>")

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Files
Map("n", "<leader>fw", "<cmd>w<cr>", "Write")
Map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")

-- Quit
Map("n", "<leader>qw", "<cmd>q<cr>", "Quit") -- window quit TODO Legg til under window management
Map("n", "<leader>qs", "<cmd>wq<cr>", "Save and Quit")
Map("n", "<leader>qq", "<cmd>qa!<cr>", "Quit all")

-- Easier access to beginning and end of lines
Map({ "n", "v" }, "<S-h>", "^", "Go to beginning of line")
Map({ "n", "v" }, "<S-l>", "g_", "Go to end of line")

-- new file
Map("n", "<leader>fn", "<cmd>enew<cr>", "New File")

-- Better window navigation
Map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
Map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
Map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
Map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
Map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
Map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
Map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
Map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
Map("n", "<C-Up>", ":resize +2<CR>")
Map("n", "<C-Down>", ":resize -2<CR>")
Map("n", "<C-Left>", ":vertical resize +2<CR>")
Map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Yank to system clipboard
Map({ "n", "v" }, "<leader>y", '"+y', "Yank to system clipboard")
Map("n", "<leader>Y", '"+Y', "Yank to system clipboard")
Map({ "n", "v" }, "<leader>p", '"+p', "Paste from system clipboard")
Map({ "n", "v" }, "<leader>P", '"+P', "Paste from system clipboard")

-- Don't override paste-buffer
Map("x", "<leader>rp", '"_dp', "Paste without overriding paste-buffer")
Map({ "n", "v" }, "<leader>rd", '"_d', "Delete without overriding paste-buffer")
Map({ "n", "v" }, "<leader>rD", '"_D', "Delete without overriding paste-buffer")

-- save file
Map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save file")

-- Deleting buffers
local buffers = require("helpers.buffers")
Map("n", "<leader>bd", buffers.delete_this, "Delete current buffer")
Map("n", "<leader>bo", buffers.delete_others, "Delete other buffers")
Map("n", "<leader>ba", buffers.delete_all, "Delete all buffers")

-- Navigate buffers
Map("n", "<S-w>", ":bnext<CR>")
Map("n", "<S-b>", ":bprevious<CR>")

-- Stay in indent mode
Map("v", "<S-tab>", "<gv")
Map("v", "<tab>", ">gv")

-- Use tab-keys for tab
Map("n", "<tab>", "v>gv<esc>")
Map("n", "<S-tab>", "v<gv<esc>")
Map("i", "<S-tab>", "<C-d>")

-- Switch between light and dark modes
Map("n", "<leader>ut", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end, "Toggle between light and dark themes")

-- Clear after search
Map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Select everything
Map("n", "<leader>a", "ggV<S-g>", "Select entire file")

-- Fuzzyfinder
local builtin = require("telescope.builtin")
Map("n", "<leader>sf", builtin.find_files, "find files")
Map("n", "<leader>sg", builtin.live_grep, "live grep")
Map("n", "<leader>sb", builtin.buffers, "buffers")
Map("n", "<leader>sh", builtin.help_tags, "help tags")
Map("n", "<leader>sn", "<cmd>Telescope notify<CR>", "Notify")

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Leap
vim.keymap.set({ "n", "v" }, "<CR>", "<Plug>(leap-forward-to)", { remap = true })
vim.keymap.set({ "n", "v" }, "<BS>", "<Plug>(leap-backward-to)", { remap = true })

-- Undotree
-- map("n", "<leader>U", "<cmd>UndotreeToggle<CR>")

-- neo-tree
Map({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<cr>", "Toggle file explorer")

-- telescope
local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', '<C-b>', function()
    builtin.buffers(
        {
            -- initial_mode = "normal",
            attach_mappings = function(prompt_bufnr, map)
                local delete_buf = function()
                    local current_picker = action_state.get_current_picker(prompt_bufnr)
                    current_picker:delete_selection(function(selection)
                        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                    end)
                end

                map('n', '<c-d>', delete_buf)

                return true
            end
        },
        {
            sort_lastused = true,
            sort_mru = true,
            theme = "dropdown"
        }
    )
end)
Map("n", "<leader>fr", builtin.oldfiles, "Recently opened")
Map("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, "Search in current buffer")

Map("n", "<leader>sf", builtin.find_files, "Files")
Map("n", "<leader>sh", builtin.help_tags, "Help")
Map("n", "<leader>sw", builtin.grep_string, "Current word")
Map("n", "<leader>sg", builtin.live_grep, "Grep")
Map("n", "<leader>sd", builtin.diagnostics, "Diagnostics")
Map("n", "<leader>sk", builtin.keymaps, "Keymaps")

-- Mason
Map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

-- Trouble
Map("n", "<leader>tx", "<cmd>Trouble diagnostics toggle focus=true<cr>", "Diagnostics (Trouble)")
Map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)")
Map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)")
Map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)")

-- #TODO-plugin
Map("n", "]t", function() require("todo-comments").jump_next() end, "Next todo comment")
Map("n", "[t", function() require("todo-comments").jump_prev() end, "Previous todo comment")
Map("n", "<leader>tt", "<cmd>TodoTrouble focus=true<cr>", "Todo (Trouble)")
Map("n", "<leader>tT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME focus=true<cr>", "Todo/Fix/Fixme (Trouble)")
Map("n", "<leader>st", "<cmd>TodoTelescope<cr>", "Todo")
Map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme")
