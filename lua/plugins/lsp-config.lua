return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({})
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local tele = require("telescope.builtin")

            local on_attach = function(client, bufnr)
                print("on_attach started")
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set("n", "<leader>gd", tele.lsp_definitions, opts)     -- Go to definition
                vim.keymap.set("n", "<leader>gi", tele.lsp_implementations, opts) -- Go to implementation
                vim.keymap.set("n", "<leader>gr", tele.lsp_references, opts)      -- Show references
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)  -- Go to declaration
                vim.keymap.set("n", "<leader>fo", function ()
                    vim.lsp.buf.format({async = true })
                end , opts)       -- Format the text

                vim.keymap.set('n', '<space>e', vim.diagnostic.open_float,
                    { noremap = true, silent = true, buffer = bufnr }
                )
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
            end

            vim.lsp.config("*", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            vim.lsp.config("roslyn", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "fullSolution",
                        dotnet_compiler_diagnostics_scope = "fullSolution",
                    }
                }
            })

            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("roslyn")
        end
    }
}
