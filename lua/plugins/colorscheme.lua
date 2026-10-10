return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                palette_overrides = {
                    dark0_hard = "#111111",
                },
                italic = {
                    strings = false,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                bold = true,
                transparent_mode = false,
            })

            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}
