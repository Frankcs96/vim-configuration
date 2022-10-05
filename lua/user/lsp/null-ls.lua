local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local M = {}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- Some projects don't use eslint so here you can add the name of the project to avoid eslint errors
local eslint_ignored_projects = {
  "m2h-amag-frontend",
  "m2h-fuel-api",
  "cdk",
}

-- add the lsp servers that you want to do the formatting
-- I will try always to use null-ls for formatting but if null-ls don't have a formatter I will add the lsp server to the list
local formatters_to_use = {
  "null-ls",
}

null_ls.setup({
  debug = true,
  sources = {
    formatting.prettierd,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.gofmt,
    formatting.stylua,
    formatting.google_java_format,
    diagnostics.eslint_d.with({
      condition = function()
        -- if table do not contain the value we return true so the project will use eslint
        return vim.tbl_contains(eslint_ignored_projects, vim.fn.fnamemodify(vim.fn.getcwd(), ":t")) == false
      end,
    }),
  },
})

-- This function will format the code using the formatters in the `formatters_to_use` table
-- Always try to use null-ls but if a language is not supported by it add the lsp to the table
M.lsp_formatting = function()
  vim.lsp.buf.format({
    filter = function(client)
      return vim.tbl_contains(formatters_to_use, client.name)
    end,
  })
end

return M
