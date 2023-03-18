vim.cmd[[colorscheme catppuccin-frappe]]

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"rust",
		"go",
		"latex",
		"mermaid",
		"python",
	},
	hightlight = { enabled = true},
	rainbow = {
		enabled = true,
		entended_mode = true
	}
})
