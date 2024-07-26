return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			plugins = { spelling = true },
			defaults = {
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Comment" },
				{ "<leader>f", group = "File" },
				{ "<leader>g", group = "Git" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>q", group = "Quit" },
				{ "<leader>r", group = "Preserve registry" },
				{ "<leader>s", group = "Search" },
				{ "<leader>u", group = "UI" },
				{ "<leader>w", group = "Window" },
				{ "<leader>x", group = "Trouble" },
			}
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
		end
	},
}
