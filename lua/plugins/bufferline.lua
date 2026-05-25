return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("bufferline").setup({
                options = {
                    separator_style = "padded_slant",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },

                highlights = {
                    buffer_selected = {
                        fg = "#ffffff",
                        bold = true,
                    },

                    indicator_selected = {
                        fg = "#ffffff",
                    },

                    separator_selected = {
                        fg = "#ffffff",
                    },

                    modified_selected = {
                        fg = "#ffffff",
                    },
                }
            })
        end
    }
}
