-- Lualine theme matching lua/theme.lua's palette (derived from alacritty.toml).
local accents = require("theme").accents

local black = "#111111"
local fg = "#d8d8d8"
local bg_mid = "#202020"
local bg_inactive = "#151515"
local grey = "#707070"

return {
    normal = {
        a = { fg = black, bg = accents.blue, gui = "bold" },
        b = { fg = fg, bg = bg_mid },
        c = { fg = "#b8b8b8", bg = bg_inactive },
    },
    insert = {
        a = { fg = black, bg = accents.magenta, gui = "bold" },
        b = { fg = fg, bg = bg_mid },
    },
    visual = {
        a = { fg = black, bg = accents.yellow, gui = "bold" },
        b = { fg = fg, bg = bg_mid },
    },
    replace = {
        a = { fg = black, bg = accents.red, gui = "bold" },
        b = { fg = fg, bg = bg_mid },
    },
    command = {
        a = { fg = black, bg = accents.cyan, gui = "bold" },
        b = { fg = fg, bg = bg_mid },
    },
    inactive = {
        a = { fg = grey, bg = bg_inactive },
        b = { fg = grey, bg = bg_inactive },
        c = { fg = grey, bg = bg_inactive },
    },
}
