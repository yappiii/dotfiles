local colors = {
  bg = "#111114",
  panel = "#17171c",
  surface = "#24242a",
  surface_active = "#2f2f36",
  text = "#f4f4f5",
  muted = "#8d8d99",
  red = "#ff6363",
  green = "#a6e3a1",
  yellow = "#f7c66f",
  blue = "#89b4fa",
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.text, bg = colors.surface_active },
    c = { fg = colors.text, bg = colors.panel },
    x = { fg = colors.text, bg = colors.panel },
    y = { fg = colors.text, bg = colors.surface },
    z = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    z = { fg = colors.bg, bg = colors.blue, gui = "bold" },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    z = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    z = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },
  command = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    z = { fg = colors.bg, bg = colors.green, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.muted, bg = colors.bg },
    b = { fg = colors.muted, bg = colors.bg },
    c = { fg = colors.muted, bg = colors.bg },
    x = { fg = colors.muted, bg = colors.bg },
    y = { fg = colors.muted, bg = colors.bg },
    z = { fg = colors.muted, bg = colors.bg },
  },
}

require("lualine").setup({
  options = {
    theme = theme,
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dashboard" },
    },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "", right = "" }, right_padding = 2 },
    },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        symbols = { added = "+", modified = "~", removed = "-" },
        colored = true,
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ●",
          readonly = " 󰌾",
          unnamed = "[No Name]",
          newfile = "[New]",
        },
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
      },
      { "filetype", colored = false },
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      { "location", separator = { left = "", right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { "filename", path = 1 },
    },
    lualine_x = {
      "location",
    },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    "nvim-tree",
    "quickfix",
  },
})
