vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_nvim_tree_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom command mappings
	vim.keymap.set("n", "<Leader>pv", "<cmd>:NvimTreeToggle<CR>")
	vim.keymap.set("n", "<Leader>lc", "<cmd>:NvimTreeFindFile<CR>")

	-- custom api mappings
	vim.keymap.set("n", "%", api.fs.create, opts("Create file"))
end

require("nvim-tree").setup({
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = {
			min = 40,
			max = 80,
		},
		relativenumber = true,
		number = true,
		float = {
			enable = false,
			quit_on_focus_loss = false,
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
	},
	on_attach = on_nvim_tree_attach,
})
