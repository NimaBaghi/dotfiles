-- See `:help vim.o`
vim.opt.shell = "zsh"

local opt = vim.opt -- for conciseness

-- Set highlight on search
-- vim.o.hlsearch = false

-- Make line numbers default
-- vim.wo.number = true
-- line numbers
opt.relativenumber = true
opt.number = true

-- Enable mouse mode
vim.o.mouse = 'a'
opt.scrolloff = 8

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- backspace 
opt.backspace = "indent,eol,start"

-- Enable break indent
vim.o.breakindent = true
-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- cursor line
opt.cursorline = true

-- Save undo history
-- backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
