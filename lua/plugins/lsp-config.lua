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

            vim.lsp.config("*", { capabilities = capabilities, })

            vim.lsp.config("roslyn", {
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
            vim.lsp.enable("gopls")
        end
    }
}
