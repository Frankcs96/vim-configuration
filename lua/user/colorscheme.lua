vim.opt.termguicolors = true

vim.g.gruvbox_contrast_dark = "hard"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[ highlight LineNr guifg=#5eacd3]])
vim.cmd([[hi CursorLineNR guibg=None]])
vim.cmd([[hi SignColumn guibg=None cterm=NONE]])
