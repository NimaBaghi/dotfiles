local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- terminal 
keymap.set("n", "<A-n>", ":terminal<CR>i", opts)
keymap.set("t", "<A-n>", "<C-\\><C-n>:terminal<CR>i", opts)

-- tig
keymap.set("n", "<leader>gs", [[<Cmd>:Tig<CR>]], opts)

-- save the yank after pasting
keymap.set("v", "p", '"_dP', opts)

-- next greatest remap ever : asbjornHaland (leader y copy to system clipboard, y copy in vim)
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

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
keymap.set("t", "<A-q>", "<C-\\><C-n>:bdelete!<CR>", opts)
keymap.set("n", "<A-l>", ":bnext<CR>", opts)
keymap.set("n", "<A-h>", ":bprevious<CR>", opts)

-- Switch ; and :
keymap.set("n", ";", ":")
keymap.set("n", ":", ";")

-- After jump stay in middle of the screen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- nvim-tree
keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>")

-- fugitive 
keymap.set("n", "<leader>gs", vim.cmd.Git);

-- undo tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
