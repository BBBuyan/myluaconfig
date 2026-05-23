require("bond.remap")
require("bond.format")
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellxquote = ""
vim.opt.termguicolors = true

vim.filetype.add({
    extension = {
        xaml = "xml",
    },
})
