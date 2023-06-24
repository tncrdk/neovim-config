-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				diagnostics_indicator = function(_, _, diag)
					local icons = require("helpers.icons").diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end
			}
		},
	},
}
