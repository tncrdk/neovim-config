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
    -- {
    --     Get breadcrumbs in title bar
    --     "SmiteshP/nvim-navic",
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --     },
    --     setup = {
    --         lsp = {
    --             auto_attach = true,
    --         }
    --     }
    -- },
}
    --             -- Set up cool signs for diagnostics
    --             local signs = require("helpers.icons").diagnostics
    --             for type, icon in pairs(signs) do
    --                 local hl = "DiagnosticSign" .. type
    --                 vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    --             end
    --
    --             -- Diagnostic config
    --             local config = {
    --                 virtual_text = true,
    --                 signs = {
    --                     active = signs,
    --                 },
    --                 update_in_insert = true,
    --                 underline = true,
    --                 severity_sort = true,
    --                 float = {
    --                     focusable = true,
    --                     style = "minimal",
    --                     border = "rounded",
    --                     source = "always",
    --                     header = "",
    --                     prefix = "",
    --                 },
    --             }
    --             vim.diagnostic.config(config)
    --
    --             -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    --             local capabilities = vim.lsp.protocol.make_client_capabilities()
    --             capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    --
    --             -- Servers
    --             -- Lua
    --             require("lspconfig").lua_ls.setup({
    --                 on_attach = on_attach,
    --                 capabilities = capabilities,
    --                 settings = {
    --                     Lua = {
    --                         completion = {
    --                             callSnippet = "Replace",
    --                         },
    --                         diagnostics = {
    --                             globals = { "vim" },
    --                         },
    --                         workspace = {
    --                             library = {
    --                                 [vim.fn.expand("$VIMRUNTIME/lua")] = true,
    --                                 [vim.fn.stdpath("config") .. "/lua"] = true,
    --                             },
    --                         },
    --                     },
    --                 },
    --             })
    --
    --             -- Python
    --             -- require("lspconfig").pyright.setup({
    --             --     on_attach = on_attach,
    --             --     capabilities = capabilities,
    --             --     settings = {
    --             --         pyright = {
    --             --             -- disableLanguageServices = true,
    --             --         },
    --             --         python = {
    --             --             analysis = {
    --             --                 -- diagnosticMode = "openFilesOnly",
    --             --                 typeCheckingMode = "basic",
    --             --                 useLibraryCodeForTypes = true,
    --             --             },
    --             --         },
    --             --     },
    --             -- })
    --             -- require'lspconfig'.clangd.setup{
    --             -- 	on_attach = on_attach,
    --             -- 	capabilities = capabilities,
    --             -- }
    --         end,
    -- },
    -- {
    --
    --     "williamboman/mason-lspconfig.nvim",
    --     config = function()
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 "lua_ls",
    --                 "pyright",
    --                 -- "pylsp",
    --                 "bashls",
    --             },
    --             automatic_installation = true,
    --         })
    --     end
    -- },
