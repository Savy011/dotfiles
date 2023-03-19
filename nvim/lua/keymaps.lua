local builtin = require('telescope.builtin')
local keymap = vim.keymap

--Increment or Decrement Values
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

--Split Buffers
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sx", ":close<CR>")

--Close Currently Open Buffer
keymap.set("n", "<leader>q", ":bd<CR>")

--Mapping for Code Folding
keymap.set("n", "zR", require('ufo').openAllFolds)
keymap.set("n", "zM", require('ufo').closeAllFolds)

--Mappings for BufferLine
keymap.set("n", "<leader>c", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>v", ":BufferLineCycleNext<CR>")

--Mappings for Nvim-Tree
keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>")

--Mappings for Zen-Mode.nvim
keymap.set("n", "<leader>z", ":ZenMode<CR>")

--Mapping for Markdown Preview
keymap.set("n", "<leader>m>", ":MarkdownPreview<CR>")

--Mapping for Telescope
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fr', ":Telescope oldfiles<CR>")
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fz', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
