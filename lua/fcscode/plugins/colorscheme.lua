-- "phosphor" matches the desktop palette; it is installed by the dotfiles
-- theme generator (~/.config/theme/apply.sh). Elsewhere, fall back to vague.
return {
  "vague2k/vague.nvim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = { transparent = true },
  init = function()
    if not pcall(vim.cmd.colorscheme, "phosphor") then
      vim.cmd.colorscheme("vague")
    end
  end,
}
