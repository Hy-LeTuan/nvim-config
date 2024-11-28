vim.o.background = "dark"

-- get color theme 
local c = require("vscode.colors").get_colors()

-- setup color theme
require("vscode").setup({
		italic_comments = true,
		disable_nvimtree_bg = true,

		color_overrides = {
				vscLineNumber = '#FFFFFF',
		},

		group_overrides = {
				Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
				Normal = { fg='#FFFFFF', bg=c.vscBack, bold=true},
		},
})

require("vscode").load()

vim.cmd.colorscheme = "vscode"
