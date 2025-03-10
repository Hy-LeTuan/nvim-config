vim.opt.runtimepath:append("~/.config/nvim")
require("config.lazy")
require("after.after_config")

-- set key leader
vim.g.mapleader = " "

-- set general config
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

-- set indentation issues
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 4
vim.opt.softtabstop = 4

-- remove comment on new line
vim.opt_local.formatoptions:remove({ "r", "o" })

-- set word wrapping & smart wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

-- set mappings for tabs
-- vim.keymap.set('n', '<Leader>pv', '<cmd>:Explore<cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>te", "<cmd>:tabnew<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tp", "<cmd>:tabprevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tn", "<cmd>:tabnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tc", "<cmd>:tabclose<cr>", { noremap = true, silent = true })

-- set mappings for window control
vim.keymap.set("n", "<Leader>vs", "<cmd>:vsplit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>hs", "<cmd>:split<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wl", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wh", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wj", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wk", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wc", "<cmd>:close<cr>", { noremap = true, silent = true })

-- set mappings for line control
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- set mappings for faster horizontal and vertical movement
vim.keymap.set("n", "zl", "20zl", { noremap = true, silent = true })
vim.keymap.set("n", "zh", "20zh", { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", "10<C-e>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "10<C-y>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- set highlight colors for cmp
-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })

-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })

-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })

-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

--set highlight for snippet
vim.cmd([[
  highlight! link hl-SnippetTabstop NONE
  highlight! link hl-SnippetPlaceholder NONE
]])

vim.keymap.set("v", "/", "<Esc>/\\%V")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "scss",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

--set keymap for quickfix list
vim.keymap.set("n", "<M-j>", "<cmd>:cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>:cprevious<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>:cclose<CR>")
