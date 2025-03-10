require("nvim-treesitter.configs").setup({
	modules = {},
	ensure_installed = { "lua", "python", "cpp", "c", "javascript", "latex", "scss", "graphql", "typescript", "bash" },
	ignore_install = {},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},

	additional_vim_regex_highlighting = false,
	indent = {
		enable = true,
	},
	debug = true,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4
