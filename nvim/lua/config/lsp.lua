--Lsp-Zero Config
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = false,
})

lsp.setup()

local cmp = require('cmp')
local cmp_config = lsp.defaults.cmp_config({
    formatting = {
	format = require('lspkind').cmp_format({
	    mode = "symbol_text",
	    menu = ({
		buffer = "[Buffer]",
		nvim_lsp = "[LSP]",
		luasnip = "[Snip]",
	    })
	})
    },
    sources = {
	{ name = 'path' },
	{ name = 'nvim_lsp', keyword_length = 3 },
	{ name = 'buffer', keyword_length = 3 },
	{ name = 'luasnip', keyword_length = 3 },
	{ name = 'emoji' }
    },
    window = {
	completion = cmp.config.window.bordered()
    }
})

cmp.setup(cmp_config)

require("lsp_lines").setup()

vim.diagnostic.config({
  virtual_text = false,
})
