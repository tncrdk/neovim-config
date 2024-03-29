-- Shell
if package.config:sub(1,1) ~= '/' then
-- Sjekker om mappe-separator er / eller \
-- PowerShell
vim.opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
end
