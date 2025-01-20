-- LSP Configuration & Plugins
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim",
                },
                opts = { lsp = { auto_attach = true } }
            }
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("nvim-navbuddy").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "pylsp",
                    "bashls",
                },
                automatic_installation = true,
            })

            -- Turn on LSP status information
            require("fidget").setup()

            -- Set up cool signs for diagnostics
            local signs = require("helpers.icons").diagnostics
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostic config
            local config = {
                virtual_text = true,
                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }
            vim.diagnostic.config(config)

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>ss", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")
                -- nvim-navbuddy
                lsp_map("<leader>ln", "<cmd>Navbuddy<cr>", bufnr, "NavBuddy")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
                lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

                -- Create a command `:Format` local to the LSP buffer

                -- Inlay hints
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
                end
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    map('<leader>lh', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end, '[T]oggle Inlay [H]ints')
                end

                -- Attach and configure vim-illuminate
                require("illuminate").on_attach(client)
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Servers
            -- Lua
            require("lspconfig").lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

            -- Python
            require("lspconfig").pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pyright = {
                        -- disableLanguageServices = true,
                    },
                    python = {
                        analysis = {
                            -- diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "basic",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            -- R
            require("lspconfig").r_language_server.setup({})

            -- require'lspconfig'.clangd.setup{
            -- 	on_attach = on_attach,
            -- 	capabilities = capabilities,
            -- }
        end,
    },
}
