return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					theme = "auto",
					disabled_filetypes = { statusline = { "dashboard", "alpha" } }
				}
			}
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"lazy"
			},
			show_trailing_blankline_indent = false,
			show_current_context = false,
		}
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
      symbol = "│",
			options = { try_as_border = true }
		},
		init = function()
			vim.api.nvim_create_autocmd("Filetype", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm"
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end
			})
		end
	},
	{
		"akinsho/bufferline.nvim",
		event = 'VeryLazy',
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bp", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" }
		},
		opts = {
			options = {
				close_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left"
					}
				}
			}
		}
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.nvim_silence = true
			require("util").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_highlight = 5,
				icons = require("config").icons.kinds
			}
		end
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
 _       __                     _         
| |     / /__  ___  ___        (_)___ ___ 
| | /| / / _ \/ _ \/ _ \______/ / __ `__ \
| |/ |/ /  __/  __/  __/_____/ / / / / / /
|__/|__/\___/\___/\___/     /_/_/ /_/ /_/ 
			]]
			
			dashboard.section.header.val = vim.split(logo, '\n')
			dashboard.section.buttons.val = {
      	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"), 
      	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"), 
      	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"), 
      	dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"), 
      	dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"), 
      	dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]), 
      	dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"), 
      	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AplhaButtons"
				button.opts.hl_shortcut = "AplhaShortcut"
			end
			
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 8
			
			return dashboard
		end,
		config = function(_, dashboard)
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AphaReady",
					callback = function()
						require("lazy").show()
					end
				})
			end

			require("alpha").setup(dashboard.opts)
			
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end
			})
		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true }
}
