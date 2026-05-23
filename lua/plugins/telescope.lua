return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "obj",
                    "bin",
                    ".git",
                    ".vs",
                    "%.jpg",
                    "%.png",
                    "%.zip",
                    ".venv",
                    "__pycache__",
                },
                layout_strategy = 'vertical'
            },
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fo', function()
            vim.lsp.buf.format({ async = true })
        end)
    end,
    opts = {
    }
}
