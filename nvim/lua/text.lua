local opt = vim.opt
local g = vim.g

opt.list = true

--Hexokinase
g.Hexokinase_highlighters = { "backgroundfull" }

--Scroll
--require('neoscroll').setup()
require('mini.animate').setup()

--Comment
require('Comment').setup()

--Autopairs
require("nvim-autopairs").setup{}

--Indent Blankline
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

--Code Folding
require('ufo').setup({
	provider_selector = function (bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end
})

--Zen Mode and Twilight
require("zen-mode").setup {
    backdrop = 0.75,
    width = .85,
    options = {
		number = true,
		cursorline = false,
		cursorcolumn = false,
    },
    plugins = {
		twilight = { enabled = true }
    }
}

require("twilight").setup {
    dimming = {
		alpha = 0.4
    },
    treesitter = true,
}

--Markdown Preview
g.mkdp_auto_start = 1
