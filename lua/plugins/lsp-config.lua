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
        ensure_installed = { "omnisharp", "lua_ls", "ts_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation on hover
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- Go to definition
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- Go to declaration
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- Go to implementation
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) -- Show references
        vim.keymap.set('n', '<space>e', function()
          vim.diagnostic.open_float(0, { scope = "line" })
        end, { noremap = true, silent = true, buffer = bufnr })
      end


      lspconfig.omnisharp.setup({
        cmd = {"omnisharp"},
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Tell LuaLS that "vim" is a global variable
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  }
}
