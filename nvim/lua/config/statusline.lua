require('lualine').setup {
    options = {
	theme = 'catppuccin',
	section_separators = { left = '', right = '' },
	component_separators = { left = '', right = '' },
	disabled_filetypes = { 'alpha' }
    }
}

require('bufferline').setup {
    options = {
	theme = 'catppuccin',
	disabled_filetypes = 'alpha'
    }
}
