local kinds_icons = require("helpers.icons").kinds

-- -- LSP Configuration & Plugins
return {
    {
        -- Highlight other occurences of the variable under cursor
        "RRethy/vim-illuminate",
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } }
    },
    {
        -- Get defaults for most language servers
        "neovim/nvim-lspconfig",
    },
    {
        -- Get breadcrumbs in title bar
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        setup = {
            lsp = {
                -- auto_attach = true,
                preference = { "vtsls", "vue_ls" }
            },
            icons = kinds_icons,
        }
    },
}
