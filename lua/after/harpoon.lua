local harpoon = require("harpoon")

-- Required setup
harpoon:setup()

vim.keymap.set("n", "<Leader>ab", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<Leader>ht", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<M-1>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<M-2>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<M-3>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<M-4>", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<M-5>", function()
	harpoon:list():select(5)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
