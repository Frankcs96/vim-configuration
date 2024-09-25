return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local custom_iceberk_dark = require("lualine.themes.iceberg_dark")
    custom_iceberk_dark.inactive.a.bg = nil
    custom_iceberk_dark.inactive.b.bg = nil
    custom_iceberk_dark.inactive.c.bg = nil
    custom_iceberk_dark.normal.a.fg = "#be8c8c"
    custom_iceberk_dark.insert.a.fg = "#be8c8c"
    custom_iceberk_dark.visual.a.fg = "#be8c8c"
    custom_iceberk_dark.normal.a.bg = nil
    custom_iceberk_dark.normal.b.bg = nil
    custom_iceberk_dark.normal.c.bg = nil
    custom_iceberk_dark.visual.a.bg = nil
    custom_iceberk_dark.visual.b.bg = nil
    custom_iceberk_dark.replace.a.bg = nil
    custom_iceberk_dark.replace.b.bg = nil
    custom_iceberk_dark.insert.a.bg = nil
    custom_iceberk_dark.insert.b.bg = nil

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = custom_iceberk_dark,
        disabled_filetypes = { "alpha", "dashboard" },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#be8c8c" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {
          {
            function()
              return os.date("%H:%M:%S")
            end,
            color = { fg = "#deb896" }, -- Customize the clock color if desired
          },
        },
      },
    })
  end,
}
