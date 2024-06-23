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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
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
