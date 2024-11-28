require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "cpp", "c" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},

	additional_vim_regex_highlighting = false,
	indent = {
		enable = true
	},
    debug = true,
})

vim.wo.foldmethod = "manual"
