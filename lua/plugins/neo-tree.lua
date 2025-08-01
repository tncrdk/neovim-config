-- Nicer filetree than NetRW
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                default_component_configs = {
                    icon = {
                        folder_empty = "󰜌",
                        folder_empty_open = "󰜌",
                    },
                    git_status = {
                        symbols = {
                            renamed = "󰁕",
                            unstaged = "󰎝",
                        },
                    },
                },
                document_symbols = {
                    kinds = {
                        File = { icon = "󰈙", hl = "Tag" },
                        Namespace = { icon = "󰌗", hl = "Include" },
                        Package = { icon = "󰏖", hl = "Label" },
                        Class = { icon = "󰌗", hl = "Include" },
                        Property = { icon = "󰆧", hl = "@property" },
                        Enum = { icon = "󰒻", hl = "@number" },
                        Function = { icon = "󰊕", hl = "Function" },
                        String = { icon = "󰀬", hl = "String" },
                        Number = { icon = "󰎠", hl = "Number" },
                        Array = { icon = "󰅪", hl = "Type" },
                        Object = { icon = "󰅩", hl = "Type" },
                        Key = { icon = "󰌋", hl = "" },
                        Struct = { icon = "󰌗", hl = "Type" },
                        Operator = { icon = "󰆕", hl = "Operator" },
                        TypeParameter = { icon = "󰊄", hl = "Type" },
                        StaticMethod = { icon = "󰠄 ", hl = "Function" },
                    },
                },
            })
        end,
    },
    {
        -- Does not seem to work with all filetypes, including python
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Uncomment whichever supported plugin(s) you use
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
}
