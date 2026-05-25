-- Leader

vim.g.mapleader = " "

-- Basic settings

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

-- Plain black background
vim.cmd("colorscheme default")
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("syntax on")

-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",a
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins

require("lazy").setup({
    -- Buffer
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
           require("bufferline").setup({})
        end
    },
    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()

          local aura = {

              normal = {
                  a = {
                      fg = "#15141b",
                      bg = "#a277ff",
                      gui = "bold"
                  },

                  b = {
                      fg = "#edecee",
                      bg = "#21202e"
                  },

                  c = {
                      fg = "#b6b2c7",
                      bg = "#15141b"
                  },
              },

              insert = {
                  a = {
                      fg = "#15141b",
                      bg = "#61ffca",
                      gui = "bold"
                  },

                  b = {
                      fg = "#edecee",
                      bg = "#21202e"
                  },
              },

              visual = {
                  a = {
                      fg = "#15141b",
                      bg = "#ffca85",
                      gui = "bold"
                  },

                  b = {
                      fg = "#edecee",
                      bg = "#21202e"
                  },
              },

              replace = {
                  a = {
                      fg = "#15141b",
                      bg = "#ff6767",
                      gui = "bold"
                  },

                  b = {
                      fg = "#edecee",
                      bg = "#21202e"
                  },
              },

              command = {
                  a = {
                      fg = "#15141b",
                      bg = "#82e2ff",
                      gui = "bold"
                  },

                  b = {
                      fg = "#edecee",
                      bg = "#21202e"
                  },
              },

              inactive = {
                  a = {
                      fg = "#6d6d6d",
                      bg = "#15141b"
                  },

                  b = {
                      fg = "#6d6d6d",
                      bg = "#15141b"
                  },

                  c = {
                      fg = "#6d6d6d",
                      bg = "#15141b"
                  },
              },
          }

                require("lualine").setup({
                    options = {
                        theme = aura,

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

                        lualine_b = {
                            "branch",
                            "diff",
                        },

                        lualine_c = {
                            {
                                "filename",
                                path = 1,
                            }
                        },

                        lualine_x = {
                            "encoding",
                            "filetype",
                        },

                        lualine_y = {
                            "progress",
                        },

                        lualine_z = {
                            "location",
                        },
                    },
                })
            end
    },
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = { width = 30 },
            })
        end
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
    },

    -- Aura Theme
    {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  },
    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                }
            })
        end
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


-- Keymaps

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- Next / previous buffer
vim.keymap.set("n", "<leader>.", ":bnext<CR>")
vim.keymap.set("n", "<leader>,", ":bprevious<CR>")

-- Close buffer
vim.keymap.set("n", "<leader>x", ":bdelete<CR>")


-- LSP Keymaps

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }

        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})
