return {
    { "lewis6991/gitsigns.nvim", config = true, },
    { 'f-person/git-blame.nvim', config = true, },
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        config = function()
            require("git-conflict").setup({
                default_mappings = {
                    ours = "<leader>co",
                    theirs = "<leader>ct",
                    none = "<leader>c0",
                    both = "<leader>cb",
                    next = "<leader>cn",
                    prev = "<leader>cp",
                },
            })
        end,
    },
}
