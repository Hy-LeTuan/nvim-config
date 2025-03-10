local builtin = require("telescope.builtin")

local function find_files()
	builtin.find_files({
		hidden = true,
		no_ignore = true,
	})
end

local function diagnostics()
	builtin.diagnostics({
		bufnr = 0,
	})
end

-- set keymaps for telescope
vim.keymap.set("n", "<leader>pf", find_files, { desc = "Telescope find files" })
vim.keymap.set(
	"n",
	"<leader>ff",
	builtin.current_buffer_fuzzy_find,
	{ desc = "Telescope fuzzy find in current buffer" }
)
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set({ "n", "v" }, "<leader>gs", builtin.grep_string, { desc = "Telescope grep string under cursor" })
vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "Telescope list all opened buffers" })
vim.keymap.set(
	"n",
	"<leader>sf",
	builtin.lsp_document_symbols,
	{ desc = "List LSP document symbols in current buffer" }
)
vim.keymap.set("n", "<leader>ts", builtin.treesitter, { desc = "List function names and variables from treesitter" })
vim.keymap.set("n", "<leader>di", diagnostics, { desc = "List all diagnostics of current buffer" })
vim.keymap.set("n", "<leader>dI", builtin.diagnostics, { desc = "List all diagnostics of all buffer" })
-- vim.keymap.set('n', '<leader>ld', function() print("hello") end)

-- set git search if current working directory is a git directory
local is_inside_work_tree = {}
local cwd = vim.fn.getcwd()

if is_inside_work_tree[cwd] == nil then
	vim.fn.system("git rev-parse --is-inside-work-tree")
	is_inside_work_tree[cwd] = vim.v_shell_error == 0 -- cache whether the function returns an error or not
	if is_inside_work_tree[cwd] then
		vim.keymap.set("n", "<leader>gF", builtin.git_files({ desc = "Telescope find git files" })) -- this function respects gitignore configs
		vim.keymap.set(
			"n",
			"<leader>gS",
			builtin.git_status,
			{ desc = "Telescope current changes per file with diff preview and add actions" }
		)
	end
end

--set ordinary search and replace
vim.keymap.set("n", "<leader>fs", function()
	vim.cmd("/\\<" .. vim.fn.input("Word grep: /\\<") .. "\\>")
end)
