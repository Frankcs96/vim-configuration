require("tokyonight").setup({
  style = "night",
})

vim.cmd([[
	colorscheme tokyonight
	hi! link CursorLineNr MatchParen 
	hi! link Folded FoldColumn
	hi! link WinSeparator LineNr
]])
