local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8B5F65" })
	-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#807865" })
	-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5C708A" })
	-- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#8C7565" })
	-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#668066" })
	-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#7A5F89" })
	-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#5E787C" })

	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#6E4B50" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#5F5A48" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#455566" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#6F5A4B" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#4D5F4D" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#5E4B6B" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#455A5D" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

-- register color hookos
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

require("ibl").setup({
	indent = { highlight = highlight, char = "│", tab_char = "│" },
	scope = { enabled = false, show_start = true, show_end = true },
	whitespace = { remove_blankline_trail = false },
})
