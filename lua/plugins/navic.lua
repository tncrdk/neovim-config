return {
    -- lsp symbol navigation for lualine
    {
        "SmiteshP/nvim-navic",
        init = function()
            vim.g.navic_silence = true
            require("helpers.lsp_attach").on_attach(function(client, buffer)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, buffer)
                end
            end)
        end,

        opts = {
            separator = ">",
            highlight = true,
            depth_limit = 10,
            icons = require("helpers.icons").kinds,
        }

    },
}
