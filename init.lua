-- =====================================================
-- Leader
-- =====================================================
vim.g.mapleader = " "

-- =====================================================
-- Basic Settings
-- =====================================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

vim.cmd("syntax on")

-- =====================================================
-- Bootstrap lazy.nvim
-- =====================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end

vim.opt.rtp:prepend(lazypath)

-- =====================================================
-- Plugins
-- =====================================================

require("lazy").setup({ -----------------------------------------------------
-- Theme
-----------------------------------------------------
{
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()

        require("ayu").setup({
            mirage = false,
            terminal = true,
            overrides = {}
        })

        vim.cmd("colorscheme ayu-light")
    end
}, -----------------------------------------------------
-- Icons
-----------------------------------------------------
{
    "nvim-tree/nvim-web-devicons",
    opts = {}
}, -----------------------------------------------------
-- Bufferline
-----------------------------------------------------
{
    "akinsho/bufferline.nvim",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()

        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                separator_style = "slant"
            }
        })

    end
}, -----------------------------------------------------
-- Lualine
-----------------------------------------------------
{
    "nvim-lualine/lualine.nvim",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()

        require("lualine").setup({

            options = {

                theme = "ayu",

                globalstatus = true,

                section_separators = {
                    left = "",
                    right = ""
                },

                component_separators = {
                    left = "│",
                    right = "│"
                }
            },

            sections = {

                lualine_a = {"mode"},

                lualine_b = {"branch", "diff"},

                lualine_c = {{
                    "filename",
                    path = 1
                }},

                lualine_x = {"encoding", "filetype"},

                lualine_y = {"progress"},

                lualine_z = {"location"}
            }

        })

    end
}, -----------------------------------------------------
-- Nvim Tree
-----------------------------------------------------
{
    "nvim-tree/nvim-tree.lua",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()

        require("nvim-tree").setup({

            view = {
                width = 30
            }

        })

    end
}, -----------------------------------------------------
-- LSP
-----------------------------------------------------
{"neovim/nvim-lspconfig"}, -----------------------------------------------------
-- Autocomplete
-----------------------------------------------------
{
    "hrsh7th/nvim-cmp",

    dependencies = {"hrsh7th/cmp-nvim-lsp"},

    config = function()

        local cmp = require("cmp")

        cmp.setup({

            mapping = cmp.mapping.preset.insert({

                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                })

            }),

            sources = {{
                name = "nvim_lsp"
            }}

        })

    end
}})

-- =====================================================
-- LSP Setup
-- =====================================================

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("pyright", {
    capabilities = capabilities
})

vim.lsp.config("clangd", {
    capabilities = capabilities
})

vim.lsp.config("tsserver", {
    capabilities = capabilities
})

vim.lsp.config("lua_ls", {
    capabilities = capabilities
})

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("tsserver")
vim.lsp.enable("lua_ls")

-- =====================================================
-- Keymaps
-- =====================================================

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

keymap.set("n", "<leader>.", ":bnext<CR>")
keymap.set("n", "<leader>,", ":bprevious<CR>")
keymap.set("n", "<leader>x", ":bdelete<CR>")
-- =====================================================
-- LSP Keymaps
-- =====================================================

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = {
            buffer = event.buf
        }

        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        keymap.set("n", "gr", vim.lsp.buf.references, opts)

        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({
                async = true
            })
        end, opts)
    end
})

-- =====================================================
-- Diagnostics
-- =====================================================

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many"
    }
})

-- =====================================================
-- Floating Windows
-- =====================================================

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded"
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded"
})

-- =====================================================
-- General UI
-- =====================================================

vim.opt.pumblend = 10
vim.opt.winblend = 10

vim.cmd([[
highlight NormalFloat guibg=NONE
highlight FloatBorder guibg=NONE
]])

-- =====================================================
-- Bufferline
-- =====================================================

vim.cmd([[
highlight BufferLineFill guibg=NONE
]])

-- =====================================================
-- NvimTree
-- =====================================================

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {
    silent = true
})
