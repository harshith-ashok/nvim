local M = {}

M.base_30 = {
  white = "#d8d8d8",
  darker_black = "#111111",
  black = "#111111",
  black2 = "#151515",
  one_bg = "#181818",
  one_bg2 = "#202020",
  one_bg3 = "#303030",
  grey = "#505050",
  grey_fg = "#707070",
  grey_fg2 = "#8a8a8a",
  light_grey = "#b8b8b8",

  red = "#909090",
  baby_pink = "#c0c0c0",
  pink = "#ababab",
  line = "#202020",

  green = "#a0a0a0",
  vibrant_green = "#d8d8d8",
  nord_blue = "#9a9a9a",
  blue = "#9a9a9a",
  yellow = "#b0b0b0",
  sun = "#c6c6c6",
  purple = "#ababab",
  dark_purple = "#707070",
  teal = "#b8b8b8",
  orange = "#aaaaaa",
  cyan = "#b8b8b8",

  statusline_bg = "#151515",
  lightbg = "#202020",
  pmenu_bg = "#303030",
  folder_bg = "#b8b8b8",
}

-- The few genuine hues in this otherwise grayscale palette (from alacritty.toml's
-- colors.normal), reused across plugins (cmp kinds, gitsigns, lualine mode colors).
M.accents = {
  green = "#AFBA31",  -- string / added
  yellow = "#99883f", -- keyword / constant
  blue = "#635a46",   -- function / changed
  magenta = "#8f6a5a", -- directive / insert mode
  cyan = "#516346",   -- escape / removed
  red = "#909090",    -- error (grayscale, no real red in this palette)
}

M.base_16 = {
  base00 = "#111111",
  base01 = "#151515",
  base02 = "#181818",
  base03 = "#303030",
  base04 = "#707070",
  base05 = "#d8d8d8",
  base06 = "#e0e0e0",
  base07 = "#f0f0f0",

  base08 = "#909090",
  base09 = "#aaaaaa",
  base0A = "#c6c6c6",
  base0B = "#a0a0a0",
  base0C = "#b8b8b8",
  base0D = "#9a9a9a",
  base0E = "#ababab",
  base0F = "#707070",
}

M.polish_hl = {
  defaults = {
    Normal = { fg = "#d8d8d8", bg = "#111111" },
    NormalNC = { fg = "#b8b8b8", bg = "#111111" },
    NormalFloat = { fg = "#d8d8d8", bg = "#202020" },
    FloatBorder = { fg = "#707070", bg = "#202020" },

    CursorLine = { bg = "#181818" },
    ColorColumn = { bg = "#181818" },
    LineNr = { fg = "#505050", bg = "#111111" },
    CursorLineNr = { fg = "#d8d8d8", bg = "#181818", bold = true },
    SignColumn = { fg = "#505050", bg = "#111111" },

    Visual = { fg = "#000000", bg = "#c8c8c8" },
    Search = { fg = "#000000", bg = "#b8b8b8" },
    IncSearch = { fg = "#000000", bg = "#e0e0e0", bold = true },
    CurSearch = { fg = "#000000", bg = "#e0e0e0", bold = true },

    Pmenu = { fg = "#d8d8d8", bg = "#202020" },
    PmenuSel = { fg = "#000000", bg = "#c8c8c8", bold = true },
    PmenuThumb = { bg = "#707070" },

    StatusLine = { fg = "#d8d8d8", bg = "#202020" },
    StatusLineNC = { fg = "#707070", bg = "#181818" },

    Comment = { fg = "#707070", italic = true },
    String = { fg = "#AFBA31" },
    Number = { fg = "#aaaaaa" },
    Boolean = { fg = "#c6c6c6", bold = true },
    Function = { fg = "#d8d8d8", bold = true },
    Keyword = { fg = "#99883f", bold = true },
    Statement = { fg = "#c6c6c6", bold = true },
    Type = { fg = "#b8b8b8" },
    Constant = { fg = "#b8b8b8" },
    Identifier = { fg = "#d8d8d8" },
    Operator = { fg = "#b8b8b8" },
    Delimiter = { fg = "#8a8a8a" },
    Special = { fg = "#d8d8d8" },
    Todo = { fg = "#000000", bg = "#d8d8d8", bold = true },
    Error = { fg = "#000000", bg = "#c8c8c8", bold = true },
  },

  treesitter = {
    ["@comment"] = { fg = "#707070", italic = true },
    ["@string"] = { fg = "#415237" },
    ["@string.escape"] = { fg = "#516346" },
    ["@number"] = { fg = "#aaaaaa" },
    ["@number.float"] = { fg = "#aaaaaa" },
    ["@boolean"] = { fg = "#c6c6c6", bold = true },

    ["@function"] = { fg = "#635a46", bold = true },
    ["@function.call"] = { fg = "#635a46" },
    ["@function.builtin"] = { fg = "#635a46" },
    ["@function.method"] = { fg = "#635a46" },
    ["@function.method.call"] = { fg = "#635a46" },

    ["@keyword"] = { fg = "#99883f", bold = true },
    ["@keyword.function"] = { fg = "#99883f", bold = true },
    ["@keyword.return"] = { fg = "#99883f", bold = true },
    ["@keyword.operator"] = { fg = "#99883f", bold = true },
    ["@operator"] = { fg = "#b8b8b8" },

    ["@type"] = { fg = "#b8b8b8" },
    ["@type.builtin"] = { fg = "#b8b8b8", bold = true },

    ["@variable"] = { fg = "#d8d8d8" },
    ["@variable.parameter"] = { fg = "#b8b8b8" },
    ["@variable.builtin"] = { fg = "#c6c6c6" },
    ["@constant"] = { fg = "#b8b8b8" },
    ["@constant.builtin"] = { fg = "#d8d8d8", bold = true },

    ["@property"] = { fg = "#b8b8b8" },
    ["@field"] = { fg = "#b8b8b8" },
    ["@punctuation.delimiter"] = { fg = "#8a8a8a" },
    ["@punctuation.bracket"] = { fg = "#b8b8b8" },

    ["@markup.heading"] = { fg = "#d8d8d8", bold = true },
    ["@markup.link"] = { fg = "#d8d8d8", underline = true },
    ["@markup.link.url"] = { fg = "#d8d8d8", underline = true },

    ["@constant.macro"] = { fg = "#635a46", bold = true },
    ["@function.macro"] = { fg = "#635a46", bold = true },
    ["@keyword.directive"] = { fg = "#8f6a5a", bold = true },
    ["@keyword.directive.define"] = { fg = "#635a46", bold = true },
  },

  nvimtree = {
    NvimTreeNormal = { fg = "#d8d8d8", bg = "#111111" },
    NvimTreeFolderName = { fg = "#b8b8b8" },
    NvimTreeOpenedFolderName = { fg = "#d8d8d8", bold = true },
    NvimTreeRootFolder = { fg = "#d8d8d8", bold = true },
    NvimTreeGitDirty = { fg = "#aaaaaa" },
    NvimTreeGitNew = { fg = "#d8d8d8" },
    NvimTreeGitDeleted = { fg = "#909090" },
  },

  telescope = {
    TelescopeNormal = { fg = "#d8d8d8", bg = "#202020" },
    TelescopeBorder = { fg = "#707070", bg = "#202020" },
    TelescopePromptNormal = { fg = "#d8d8d8", bg = "#181818" },
    TelescopePromptBorder = { fg = "#707070", bg = "#181818" },
    TelescopeSelection = { fg = "#000000", bg = "#c8c8c8", bold = true },
    TelescopeMatching = { fg = "#f0f0f0", bold = true },
  },

  diagnostics = {
    DiagnosticError = { fg = "#ababab" },
    DiagnosticWarn = { fg = "#99883f" },
    DiagnosticInfo = { fg = "#516346" },
    DiagnosticHint = { fg = "#635a46" },
    DiagnosticOk = { fg = "#415237" },

    DiagnosticSignError = { fg = "#ababab" },
    DiagnosticSignWarn = { fg = "#99883f" },
    DiagnosticSignInfo = { fg = "#516346" },
    DiagnosticSignHint = { fg = "#635a46" },
    DiagnosticSignOk = { fg = "#415237" },

    DiagnosticUnderlineError = { undercurl = true, sp = "#ababab" },
    DiagnosticUnderlineWarn = { undercurl = true, sp = "#99883f" },
    DiagnosticUnderlineInfo = { undercurl = true, sp = "#516346" },
    DiagnosticUnderlineHint = { undercurl = true, sp = "#635a46" },
  },

  gitsigns = {
    GitSignsAdd = { fg = "#415237" },
    GitSignsChange = { fg = "#99883f" },
    GitSignsDelete = { fg = "#8f6a5a" },
  },

  -- nvim-cmp kind icons (via lspkind.nvim), reusing the few real hues above.
  cmp = {
    CmpItemAbbr = { fg = "#b8b8b8" },
    CmpItemAbbrMatch = { fg = "#d8d8d8", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = "#d8d8d8", bold = true },
    CmpItemAbbrDeprecated = { fg = "#707070", strikethrough = true },
    CmpItemMenu = { fg = "#707070", italic = true },

    CmpItemKindDefault = { fg = "#8a8a8a" },
    CmpItemKindText = { fg = "#b8b8b8" },
    CmpItemKindVariable = { fg = "#d8d8d8" },
    CmpItemKindFunction = { fg = "#635a46", bold = true },
    CmpItemKindMethod = { fg = "#635a46", bold = true },
    CmpItemKindConstructor = { fg = "#8f6a5a" },
    CmpItemKindField = { fg = "#516346" },
    CmpItemKindProperty = { fg = "#516346" },
    CmpItemKindClass = { fg = "#99883f" },
    CmpItemKindInterface = { fg = "#99883f" },
    CmpItemKindStruct = { fg = "#99883f" },
    CmpItemKindModule = { fg = "#8f6a5a" },
    CmpItemKindUnit = { fg = "#8f6a5a" },
    CmpItemKindValue = { fg = "#99883f" },
    CmpItemKindEnum = { fg = "#99883f" },
    CmpItemKindEnumMember = { fg = "#635a46" },
    CmpItemKindKeyword = { fg = "#99883f", bold = true },
    CmpItemKindSnippet = { fg = "#516346" },
    CmpItemKindColor = { fg = "#8f6a5a" },
    CmpItemKindFile = { fg = "#516346" },
    CmpItemKindFolder = { fg = "#516346" },
    CmpItemKindReference = { fg = "#8f6a5a" },
    CmpItemKindConstant = { fg = "#99883f" },
    CmpItemKindEvent = { fg = "#8f6a5a" },
    CmpItemKindOperator = { fg = "#ababab" },
    CmpItemKindTypeParameter = { fg = "#ababab" },
  },
}

M.type = "dark"

function M.apply()
  vim.opt.background = M.type
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "reference"

  for _, group_table in pairs(M.polish_hl) do
    for group, hl in pairs(group_table) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  -- `hi clear` above wipes highlight groups plugins generated at their own
  -- setup time (e.g. lualine's theme). Re-fire ColorScheme so they regenerate.
  vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end

return M
