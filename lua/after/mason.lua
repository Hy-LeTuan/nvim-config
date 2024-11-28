require("mason").setup()
require("mason-lspconfig").setup(
{
    automatic_installation = true,
    ensure_installed = {
        "lua_ls", "pylsp", "clangd", "cmake"
    },
})

-- define cmp functionalities
local cmp = require("cmp")
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- define capabilities for lsp client
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- define a fucntion for kep mapping when buffer is attached to lsp client
local function on_attach_map_hover(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
    vim.keymap.set('n', '<F2>', "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, noremap = true, silent = true })
end

require("lspconfig").clangd.setup({
    on_attach = on_attach_map_hover,
    capabilities = capabilities,
    single_file_support = true,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})

require("lspconfig").cmake.setup({
    on_attach = on_attach_map_hover,
    capabilities = capabilities,
    single_file_support = true,
})

require("lspconfig").lua_ls.setup({
    on_attach = on_attach_map_hover,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            }
        },
    }
})

require("lspconfig").dartls.setup({
    capabilities = capabilities,
    on_attach = on_attach_map_hover,
    cmd = { "dart", "language-server", "--protocol=lsp" }, -- Dart LSP command
})

require("lspconfig").yamlls.setup({
    capabilities = capabilities,
})

-- define a user command for setting correct python interpreter
vim.api.nvim_create_user_command("SetPyInter", function(opts)
    local args = {}
    local counter = 0

    for i in string.gmatch(opts.args, "%S+") do
        args[counter] = i
        counter = counter + 1
    end

    local python_path = args[0]

    if counter >= 1 then
        local index = args[1]
    end

    if python_path == "" then
        print("No path provided, default to dl_310 intepreter path.")
        python_path = "/home/hyle/miniconda3/envs/dl_310/bin/python"
        return
    end

    require("lspconfig").pylsp.setup({
        on_attach = on_attach_map_hover,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = {'W391', 'E501'},
                        maxLineLength = 300
                    },
                    flake8 = {
                        ignore = {'W391', 'E501'},
                        maxLineLength = 300,
                    }
                },
            }
        },
        cmd = { python_path, "-m", "pylsp" },
        capabilities = capabilities,
    })

    print("pylsp set up with intepreter: " ..python_path)
end, { nargs = '*', complete='file'})
