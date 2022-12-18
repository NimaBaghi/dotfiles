vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- save the yank after pasting
keymap.set("v", "p", '"_dP', opts)

-- next greatest remap ever : asbjornHaland (leader y copy to system clipboard, y copy in vim)
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- change project
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- change whole character
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- change some file to executable file
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

--better split movements
keymap.set("n", "<C-J>", "<C-W><C-J>")
keymap.set("n", "<C-K>", "<C-W><C-K>")
keymap.set("n", "<C-L>", "<C-W><C-L>")
keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Navigation
-- keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
-- keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)
-- keymap.set("n", "<A-q>", "<Cmd>BufferClose<CR>", opts)
-- keymap.set("i", "<A-q>", "<Cmd>BufferClose<CR>", opts)
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab

keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h", { silent = true, noremap = true })
keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j", { silent = true, noremap = true })
keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k", { silent = true, noremap = true })
keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l", { silent = true, noremap = true })

-- Up & Down line
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap.set("i", "<A-q>", "<Esc>:bdelete<CR>", opts)
keymap.set("n", "<A-q>", "<Esc>:bdelete<CR>", opts)
keymap.set("n", "<A-l>", ":bnext<CR>", opts)
keymap.set("n", "<A-h>", ":bprevious<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Switch ; and :
keymap.set("n", ";", ":")
keymap.set("n", ":", ";")

-- After jump stay in middle of the screen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>d", ":NERDTreeToggle<CR>") 

-- telescope
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

