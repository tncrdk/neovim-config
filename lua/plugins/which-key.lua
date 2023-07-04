return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({
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
			})
		end,
	},
}
