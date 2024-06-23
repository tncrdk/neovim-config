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
				["<leader>"] = {
					f = { name = "File" },
					b = { name = "Buffers" },
					c = { name = "Comment" },
					q = { name = "Quit" },
					s = { name = "Search" },
					l = { name = "LSP" },
					u = { name = "UI" },
					g = { name = "Git" },
					w = { name = "Window" },
					x = { name = "Trouble" },
					r = { name = "Preserve registry" }
				},
			}
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end
	},
}
