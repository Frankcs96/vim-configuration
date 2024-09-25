return {
  "vague2k/vague.nvim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = { transparent = true },
  init = function()
    vim.cmd.colorscheme("vague")
  end,
}
