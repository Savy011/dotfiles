local opt = vim.opt

opt.clipboard = 'unnamedplus'

opt.termguicolors = true
opt.cursorline = true

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

opt.backup = false
opt.swapfile = true
opt.showmode = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true

opt.iskeyword:append("-")
