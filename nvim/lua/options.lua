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
--opt.splitbottom = false

opt.iskeyword:append("-")

o.conceallevel = 2

o.foldcolumn = '0'
o.foldlevel = 99 
o.foldlevelstart = 99
o.foldenable = true
