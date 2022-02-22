-- Float borders
vim.cmd("au ColorScheme * hi NormalFloat guibg=NONE")
vim.cmd("au ColorScheme * hi FloatBorder guibg=NONE guifg=#eeeeee")
vim.cmd("au ColorScheme * hi ErrorFloat guibg=NONE")
vim.cmd("au ColorScheme * hi WarningFloat guibg=NONE")
vim.cmd("au ColorScheme * hi InfoFloat guibg=NONE")
vim.cmd("au ColorScheme * hi HintFloat guibg=NONE")
vim.cmd("augroup END")

vim.opt.termguicolors = true

local colorscheme_cmd = "colorscheme onedark"
local success, err = pcall(vim.cmd, colorscheme_cmd)
if not success then
	vim.api.nvim_err_writeln(err)
end
