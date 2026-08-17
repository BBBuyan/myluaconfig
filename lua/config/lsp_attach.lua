local tele = require("telescope.builtin")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true, }

        vim.keymap.set("n", "<leader>gd", tele.lsp_definitions, opts)                               -- Go to definition
        vim.keymap.set("n", "<leader>gi", tele.lsp_implementations, opts)                           -- Go to implementation
        vim.keymap.set("n", "<leader>gr", tele.lsp_references, opts)                                -- Show references
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)                            -- Go to declaration
        vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format({ async = true }) end, opts) -- Format the text
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    end
})
