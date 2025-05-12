-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true -- Dit zorgt ervoor dat line numbers altijd zichtbaar zijn, niet alleen relatief.uu
vim.opt.cursorline = false
-- vim.opt.spelllang = nl, en
vim.opt.colorcolumn = "80"
vim.opt.linebreak = true
vim.opt.textwidth = 79
vim.opt.wrap = true
vim.opt.formatoptions:append("t")
-- vim.opt.formatoptions:append("a")

vim.opt_local.colorcolumn = "80"
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.formatoptions:append("t")
-- vim.opt_local.formatoptions:append("a") -- auto-format bij typen
