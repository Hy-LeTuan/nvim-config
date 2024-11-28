vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_nvim_tree_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom command mappings
    vim.keymap.set('n', '<Leader>pv', "<cmd>:NvimTreeToggle<CR>")
    vim.keymap.set('n', '<Leader>loc', "<cmd>:NvimTreeFindFile<CR>")

    -- custom api mappings
    vim.keymap.set('n', '%', api.fs.create, opts("Create file"))
end

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        relativenumber = true,
        number = true
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
    on_attach = on_nvim_tree_attach
})
