vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Shorten function name
local keymap = vim.keymap.set

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>")
keymap("n", "<S-TAB>", ":bprevious<CR>")
keymap("n", "<leader>c", "<cmd>bdelete!<CR>", { desc = "Close buffer" })

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No highlight" })
keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })

keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })
