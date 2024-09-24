-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = { file_ignore_patterns = { "node_modules", ".git/.*", "target", ".mvn", ".env/.*", "yarn.lock" } },
  },
  keys = {
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>", desc = "Find files" },
    { "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
  },
}
