vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true, }

        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)                              -- Go to definition
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)                          -- Go to implementation
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)                              -- Show references
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)                             -- Go to declaration
        vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format({ async = true }) end, opts) -- Format the text
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "LSP: Show incoming calls" })
        vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "LSP: Show incoming calls" })
        vim.keymap.set("n", "<leader>s", function()
            vim.ui.input({ prompt = "Workspace symbol: " }, function(query)
                if query and query ~= "" then
                    vim.lsp.buf.workspace_symbol(query)
                end
            end)
        end, { desc = "Search workspace symbols" })
        -- Show all currently known diagnostics
        vim.keymap.set("n", "<leader>xd", function()
            vim.diagnostic.setqflist()
        end, {
            desc = "Show workspace diagnostics",
        })

        -- Show diagnostics for current buffer
        vim.keymap.set("n", "<leader>xb", function()
            vim.diagnostic.setloclist()
        end, {
            desc = "Show buffer diagnostics",
        })
    end

})
