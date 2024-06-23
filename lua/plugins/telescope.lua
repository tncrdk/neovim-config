return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = {
                        "fd",
                        "--type",
                        "f",
                        "-u",
                        "-E",
                        "**/.git/*",
                        "-E",
                        "**/.idea/*",
                        "-E",
                        "**/target/*",
                        "-E",
                        "**/build/*",
                        "-E",
                        "**/dist/*",
                        "-E",
                        "**/yarn.lock",
                        "-E",
                        "**/package-lock.json",
                    },
                },
            },
        })

        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
    end,
}
