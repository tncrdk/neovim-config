local diagnostic_icons = require("helpers.icons").diagnostics

local get_venv = function()
    local venv_name = vim.fn.getenv("VIRTUAL_ENV")
    if venv_name ~= nil then
        return string.gsub(venv_name, ".*[\\/]", "")
    else
        return ""
    end
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local opts = {
    colors = {
        bg       = '#202328',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
        white    = "#ffffff",
    },

    modes = {
        n = "N",
        i = "I",
        v = "v",
        V = "V",
        [''] = "['']",
        c = "C",
        no = "no",
        s = "s",
        S = "S",
        [''] = "['']",
        ic = "ic",
        R = "R",
        Rv = "Rv",
        cv = "cv",
        ce = "ce",
        r = "r",
        rm = "rm",
        ['r?'] = "['r?']",
        ['!'] = "['!']",
        t = "t",
    }

}

local mode_color = {
    n = opts.colors.blue,
    i = opts.colors.yellow,
    v = opts.colors.orange,
    V = opts.colors.green,
    [''] = opts.colors.blue,
    c = opts.colors.magenta,
    no = opts.colors.red,
    s = opts.colors.orange,
    S = opts.colors.orange,
    [''] = opts.colors.orange,
    ic = opts.colors.yellow,
    R = opts.colors.violet,
    Rv = opts.colors.violet,
    cv = opts.colors.red,
    ce = opts.colors.red,
    r = opts.colors.cyan,
    rm = opts.colors.cyan,
    ['r?'] = opts.colors.cyan,
    ['!'] = opts.colors.red,
    t = opts.colors.red,
}

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                -- theme = evil_lualine,
                component_separators = "",
                -- section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    -- {
                    --     function()
                    --         return '▊'
                    --     end,
                    --     color = { fg = opts.colors.blue }, -- Sets highlighting of component
                    --     padding = { left = 0, right = 1 }, -- We don't need space before this
                    -- },
                    {
                        function()
                            return opts.modes[vim.fn.mode()]
                        end,
                        color = function()
                            return { fg = mode_color[vim.fn.mode()] }
                        end,
                        padding = { right = 1, left = 1 },
                    },
                    {
                        -- filesize component
                        'filesize',
                        cond = conditions.buffer_not_empty,
                        color = { fg = opts.colors.orange },
                    },
                    {
                        'filename',
                        cond = conditions.buffer_not_empty,
                        color = { fg = opts.colors.magenta, gui = 'bold' },
                    },
                    "location",
                    {
                        'progress',
                        color = { fg = opts.colors.fg, gui = 'bold' }
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = diagnostic_icons.Error,
                            warn = diagnostic_icons.Warn,
                            info = diagnostic_icons.Info,
                            hint = diagnostic_icons.Hint,
                        },
                    },
                    {
                        function()
                            return "%="
                        end,
                    },
                    {
                        'branch',
                        icon = '',
                        color = { fg = opts.colors.violet, gui = 'bold' },
                    },
                    {
                        'diff',
                        -- Is it me or the symbol for modified us really weird
                        symbols = { added = ' ', modified = '󰑕 ', removed = ' ' },
                        diff_color = {
                            added = { fg = opts.colors.green },
                            modified = { fg = opts.colors.orange },
                            removed = { fg = opts.colors.red },
                        },
                        cond = conditions.hide_in_width,
                    }
                },
                lualine_x = {
                    -- {
                    --     get_venv,
                    --     icon = "󰅩",
                    --     color = { fg = "#8fb55e" }
                    -- },
                    {
                        "filetype",
                        cond = conditions.buffer_not_empty,
                        color = { fg = opts.colors.blue, gui = 'bold' }
                    },
                    {
                        -- Lsp server name .
                        function()
                            local msg = 'No Active Lsp'
                            local buf_ft = vim.api.nvim_get_option_value('filetype', {})
                            local clients = vim.lsp.get_clients()
                            if next(clients) == nil then
                                return msg
                            end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return client.name
                                end
                            end
                            return msg
                        end,
                        icon = ' ',
                        color = { fg = opts.colors.yellow, gui = 'bold' },
                    },
                    -- {
                    --     function()
                    --         return '▊'
                    --     end,
                    --     color = { fg = opts.colors.blue },
                    --     padding = { left = 1 },
                    -- }
                },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        },
    },
}
