return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },

        config = function()
            -- Every section of the bar takes on the current mode's color
            local fg = "#282828"
            local function mode_theme(bg)
                local section = { fg = fg, bg = bg }
                return { a = vim.tbl_extend("force", section, { gui = "bold" }), b = section, c = section }
            end

            local theme = {
                normal = mode_theme("#83a598"),
                insert = mode_theme("#b8bb26"),
                visual = mode_theme("#fe8019"),
                replace = mode_theme("#fb4934"),
                command = mode_theme("#d3869b"),
                terminal = mode_theme("#8ec07c"),
                inactive = mode_theme("#504945"),
            }

            require("lualine").setup({
                options = {
                    theme = theme,

                    section_separators = {
                        left = "",
                        right = "",
                    },

                    component_separators = {
                        left = "│",
                        right = "│",
                    },

                    globalstatus = true,
                },

                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                            symbols = { modified = " ●", readonly = " " },
                        },
                    },

                    lualine_x = {
                        {
                            "diagnostics",
                            symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        },
                        {
                            "lsp_status",
                            icon = "",
                            symbols = { done = "", separator = " " },
                        },
                        "filetype",
                    },

                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
}
