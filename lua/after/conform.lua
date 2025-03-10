local conform = require("conform")

conform.setup({
	lsp_format = { "fallback" },
	stop_after_first = true,
	notify_no_formatters = true,
	notify_on_error = true,

	formatters_by_ft = {
		javascript = { "prettier", "prettierd", stop_on_first = true },
		typescript = { "prettier", "prettierd", stop_on_first = true },
		javascriptreact = { "prettier", "prettierd", stop_on_first = true },
		typescriptreact = { "prettier", "prettierd", stop_on_first = true },
		svelte = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
	},

	-- Format on save to listen to toggle command
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,
})

vim.keymap.set({ "n", "v" }, "<Leader>mp", function()
	conform.format({
		lsp_format = "fallback",
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)", noremap = true })

-- Command for disabling format
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*" },
-- 	callback = function(args)
-- 		conform.format({ bufnr = args.buf })
-- 	end,
-- })
