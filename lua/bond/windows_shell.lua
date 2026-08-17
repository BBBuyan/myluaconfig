local os_name = vim.uv.os_uname().sysname;

if os_name == "Windows_NT" then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellxquote = ""
    vim.opt.termguicolors = true
end
