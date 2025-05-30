-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = { file_ignore_patterns = { ".git/.*", "target", ".mvn", ".env/.*", "yarn.lock" } },
  },
  keys = {
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>", desc = "Find files" },
    { "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
    {
      "<leader>b",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
      desc = "Find buffers",
    },
  },
}
