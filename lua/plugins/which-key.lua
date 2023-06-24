return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register(
				{
					["<leader>"] = {
						f = { name = "File" },
						b = { name = "Buffers" },
						q = { name = "Quit" },
						s = { name = "Search" },
						l = { name = "LSP" },
						u = { name = "UI" },
						d = { name = "Debugging" },
						g = { name = "Git" },
						w = { name = "Window" }
					}
				}
			)
		end
	}
}
