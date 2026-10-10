return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },

        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox",

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
