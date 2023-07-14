return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>lsp", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"astro-language-server",
				"css-lsp",
				"eslint_d",
				"gopls",
				"html-lsp",
				"markdownlint",
				"markuplint",
				"tailwindcss-language-server",
				"typescript-language-server",
				"yaml-language-server"
			}
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			require("lsp-zero.settings").preset({})
		end
	},
	{
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      { "mason.nvim" },
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

    	lsp.setup()
    end
  }
}
