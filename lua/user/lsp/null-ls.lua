local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

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
