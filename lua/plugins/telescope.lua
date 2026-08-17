return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
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
    },
    config = function(_, opts)
        require('telescope').setup(opts);

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    end,
}
