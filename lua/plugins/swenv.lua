local function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

local get_venvs_modified = function(venvs_path)
	local success, Path = pcall(require, "plenary.path")
	if not success then
		vim.notify("Could not require plenary: " .. Path, vim.log.levels.WARN)
		return
	end
	local venvs = {}
	local scan_dir = require("plenary.scandir").scan_dir

	-- vim.notify(dump(venvs), vim.log.levels.WARN)
	local paths = scan_dir(venvs_path, { depth = 1, only_dirs = true, silent = true })
	-- vim.notify(dump(paths), vim.log.levels.WARN)

	for _, path in ipairs(paths) do
		-- vim.notify(path, vim.log.levels.WARN)
		table.insert(venvs, {
			name = string.gsub(path, ".*[\\/]", ""),
			path = path,
			source = "venv",
		})
	end

	-- vim.notify(dump(venvs), vim.log.levels.WARN)

	return venvs
end

return {
	"AckslD/swenv.nvim",
	config = function()
		require("swenv").setup({
			-- Should return a list of tables with a `name` and a `path` entry each.
			-- Gets the argument `venvs_path` set below.
			-- By default just lists the entries in `venvs_path`.
			get_venvs = function(venvs_path)
				return get_venvs_modified(venvs_path)
			end,
			-- Path passed to `get_venvs`.
			venvs_path = { vim.fn.expand("~/.venvs"), vim.fn.expand("~/.virtualenvs") },
			-- venvs_path = { vim.fn.expand("~/.venvs"), vim.fn.getcwd() },
			-- Something to do after setting an environment, for example call vim.cmd.LspRestart
			post_set_venv = function()
				vim.cmd("LspRestart")
			end,
		})
	end,
}
