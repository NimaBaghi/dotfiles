local opt = vim.opt -- for conciseness
-- local u = require("config.utils")
local api = vim.api

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- enable hidden buffers
opt.hidden = true

opt.iskeyword:append("-")

-- backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- scroll of screen
opt.scrolloff = 8
opt.mouse = "a"

opt.updatetime = 50

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
})
