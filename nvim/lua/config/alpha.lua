local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

require('alpha').setup(
    require('alpha.themes.dashboard').config
)

dashboard.section.header.val = {
    [[ _       __                     _         ]],
    [[| |     / /__  ___  ___        (_)___ ___ ]],
    [[| | /| / / _ \/ _ \/ _ \______/ / __ `__ \]],
    [[| |/ |/ /  __/  __/  __/_____/ / / / / / /]],
    [[|__/|__/\___/\___/\___/     /_/_/ /_/ /_/ ]],
    [[                                          ]],
}


dashboard.section.buttons.val = {
    dashboard.button("n", "📝	New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "🕒	Recent Files", ":lua require('telescope.builtin').oldfiles{}<CR>"),
    dashboard.button("e", "📁	File Browser", ":NvimTreeOpen<CR>"),
    dashboard.button("c", "✨	Change Theme", ":Telescope colorscheme<CR>"),
    dashboard.button("p", "✅	PackerSync", ":PackerSync<CR>"),
    dashboard.button(".", "🧰	Open Config Folder", ":NvimTreeOpen ~/.config/nvim/<CR>"),
    dashboard.button("q", "🛑	Quit (Neo)Vim", ":qa<CR>"),
}

dashboard.section.footer.val = {
	'',
	'Can We Do? We Can Do! WEEEKLY!!',
	'',
}
