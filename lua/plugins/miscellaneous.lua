return {
    { "tpope/vim-sleuth",            event = "VeryLazy" }, -- Detect tabstop and shiftwidth automatically
    { "tpope/vim-surround",          event = "VeryLazy" }, -- Surround stuff with the ys-, cs-, ds- commands
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "ggandor/leap.nvim" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    { "brenoprata10/nvim-highlight-colors", config = true, },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                app = "brave"
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
    -- Mini
    { 'echasnovski/mini.jump',              version = '*', config = true, },
    { 'echasnovski/mini.splitjoin',         version = '*', config = true, },
    { 'echasnovski/mini.move',              version = '*', config = true, },
    { 'echasnovski/mini.indentscope',       version = '*', config = true, },
    {
        'echasnovski/mini.comment',
        version = '*',
        opts = {
            mappings = {
                comment = "<leader>cc",
                comment_line = "<leader>cl",
                comment_visual = "<leader>c",
                textobject = "/",
            },
        },
        config = true,
    },

}
