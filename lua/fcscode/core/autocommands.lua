vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "oil" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.java" },
--   callback = function()
--     vim.lsp.codelens.refresh()
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function()
--     vim.cmd("hi link illuminatedWord LspReferenceText")
--   end,
-- })

-- -- Optionally trigger diagnostics on relevant text changes and cursor movement
-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "CursorHold" }, {
--   callback = function()
--     vim.diagnostic.setloclist({ open = false }) -- Automatically update diagnostics and loclist
--   end,
-- })
