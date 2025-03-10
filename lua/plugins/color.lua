-- return {
-- 	"Mofiqul/vscode.nvim",
-- }

-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
--
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
