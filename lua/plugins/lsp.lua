vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        local keymap = vim.keymap

        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})

return {
    { "neovim/nvim-lspconfig" },

    { "onsails/lspkind.nvim" },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })

            -- LSP Setup (Neovim 0.11+)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("pyright", { capabilities = capabilities })
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.config("tsserver", { capabilities = capabilities })
            vim.lsp.config("lua_ls", { capabilities = capabilities })

            vim.lsp.enable("pyright")
            vim.lsp.enable("clangd")
            vim.lsp.enable("tsserver")
            vim.lsp.enable("lua_ls")
        end,
    },
}
