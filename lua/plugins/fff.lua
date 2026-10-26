-- Package name changed from `fff.nvim` to `fff`. If you installed fff.nvim before, clean with `:Lazy clean`
return {
    'dmtrKovalenko/fff',
    build = function()
        -- downloads a prebuilt binary or falls back to cargo build
        require("fff.download").download_or_build_binary()
    end,
    -- for nixos:
    -- build = "nix run .#release",
    opts = {
        debug = {
            enabled = true,
            show_scores = true,
        },
    },
    lazy = false, -- the plugin lazy-initialises itself
    config = function()
        local fff = require("fff")
        vim.keymap.set("n", "<leader>ff", function()
            fff.find_files()
        end)
        vim.keymap.set("n", "<leader>fg", function()
            fff.live_grep()
        end)
        vim.keymap.set("n", "<leader>fd", function()
            fff.find_files_in_dir(vim.fn.expand("%:p:h"))
        end)
        vim.keymap.set({ "n", "x" }, "<leader>fw", function()
            require("fff").live_grep_under_cursor()
        end, { desc = "Grep word under cursor" })
    end,
}
