return {
    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function ()
            require("mason-lspconfig").setup({
                ensure_installed = { "omnisharp", "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            vim.lsp.enable("pyright")

            vim.lsp.enable("lua_ls")

            vim.lsp.enable("omnisharp")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation on hover
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- Go to definition
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- Go to declaration
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- Go to implementation
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) -- Show references
            vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, opts) -- Show references
            vim.keymap.set('n', '<space>e', function()
                vim.diagnostic.open_float(0, { scope = "line" })
            end, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
        end
        vim.lsp.config("*", {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        end
        --   local capabilities = require('cmp_nvim_lsp').default_capabilities()
        --
        --   local lspconfig = require("lspconfig")
        --


        --   lspconfig.omnisharp.setup({
        --     cmd={"omnisharp"},
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     FormattingOptions = {
        --       EnableEditorConfigSupport = true,
        --       OrganizeImprts = true,
        --     }
        --   })
        --
        --   lspconfig.pyright.setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach
        --   })
    }
}
