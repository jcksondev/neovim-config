local opt = vim.opt

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.fileencoding = "utf-8"
opt.linebreak = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.syntax = "enable"
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.backspace = "indent,eol,start"
opt.hidden = true
opt.background = "dark"
opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")
vim.cmd([[set re=0]])
opt.swapfile = false
