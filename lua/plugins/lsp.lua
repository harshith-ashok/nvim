vim.diagnostic.config({
    underline = true,
    update_in_insert = true, -- show diagnostics live while typing, not just on InsertLeave
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
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        keymap.set("n", "gr", vim.lsp.buf.references, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    end,
})

return {
    { "neovim/nvim-lspconfig" },

    { "onsails/lspkind.nvim" },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
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

            -- C / C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                },
            })

            -- Python
            vim.lsp.config("pyright", { capabilities = capabilities })

            vim.lsp.config("ts_ls", { capabilities = capabilities })
            vim.lsp.config("lua_ls", { capabilities = capabilities })

            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("lua_ls")
        end,
    },
}
