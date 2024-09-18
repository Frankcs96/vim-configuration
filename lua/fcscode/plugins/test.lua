return {
  "vim-test/vim-test",
  init = function()
    vim.g["test#strategy"] = "basic"
    vim.g["test#preserve_screen"] = 0
    vim.g["test#basic#start_normal"] = 1
  end,
  keys = {
    {
      "<leader>tf",
      "<cmd>TestFile<cr>",
      desc = "Test File",
    },
    {
      "<leader>tl",
      "<cmd>TestLast<cr>",
      desc = "Test Nearest",
    },
    {
      "<leader>tn",
      "<cmd>TestNearest<cr>",
      desc = "Test Nearest",
    },
  },
}
