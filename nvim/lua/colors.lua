vim.cmd[[colorscheme tokyonight]]

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
	hightlight = {
		enabled = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	rainbow = {
		enabled = true,
		entended_mode = true
	}
})
