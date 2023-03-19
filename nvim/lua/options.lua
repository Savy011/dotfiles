local opt = vim.opt
local o = vim.o

opt.clipboard = 'unnamedplus'

opt.termguicolors = true
opt.cursorline = true

opt.number = true
opt.relativenumber = true

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

o.foldcolumn = '1'
o.foldlevel = 99 
o.foldlevelstart = 99
o.foldenable = true
