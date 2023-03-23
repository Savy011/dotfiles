local opt = vim.opt
local g = vim.g
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

opt.list = true

--Hexokinase
g.Hexokinase_highlighters = { "backgroundfull" }

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
	end,
    fold_virt_text_handler = handler
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

--Vim-Markdown
g.vim_markdown_folding_disabled = 1

--Markdown Preview
g.mkdp_auto_start = 1
