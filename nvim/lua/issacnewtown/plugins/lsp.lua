return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "mfussenegger/nvim-jdtls",
    },

    config = function()
        require("mason").setup()

        -- require("issacnewtown.lspconfig.java")
        -- require("issacnewtown.lspconfig.lua_ls")


        vim.lsp.config("jdtls", {
            settings = {
                java = {
                    -- Custom eclipse.jdt.ls options go here
                },
            },
        })

        vim.lsp.config['lua_ls'] = {
            -- Command and arguments to start the server.
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },

            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    }
                }
            }
        }






        vim.lsp.enable({
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
            "clangd",
            "jdtls",
        })


        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end, 
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                documentation = { border = "rounded" },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })


        vim.diagnostic.config({
            update_in_insert = true,
            virtual_text = true,
            jump = { float = true },
        })
    end
}
