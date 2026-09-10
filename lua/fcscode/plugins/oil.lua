return {
  "stevearc/oil.nvim",
  opts = { float = { border = "rounded" } },

  keys = {
    {
      "<leader>-",
      function()
        require("oil").toggle_float()
      end,
      "<cmd>Oil --float<cr>",
      desc = "Test File",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
