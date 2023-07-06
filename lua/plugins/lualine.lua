local diagnostic_icons = require("helpers.icons").diagnostics

local get_venv = function()
	local venv_name = vim.fn.getenv("VIRTUAL_ENV")
	if venv_name ~= nil then
		return string.gsub(venv_name, ".*[\\/]", "")
	else
		return ""
	end
end

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = bubbles_theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = { "fileformat" },
				lualine_x = {
					{
						"diagnostics",
						symbols = {
							error = diagnostic_icons.Error,
							warn = diagnostic_icons.Warn,
							info = diagnostic_icons.Info,
							hint = diagnostic_icons.Hint,
						},
					},
					{ get_venv, icon = "󰅩", color = { fg = "#8fb55e" } },
				},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		},
	},
}
