require('nvim-tree').setup({
    filters = {
		dotfiles = true,
	},
	actions = {
        open_file = {
			quit_on_open = true,
        },
    },
	renderer = {
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
})
