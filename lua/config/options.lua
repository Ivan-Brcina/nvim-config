vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.termguicolors = true

vim.diagnostic.config({
  virtual_text = true,       -- show the actual error message inline, not just a letter
  signs = true,               -- keep the sign column letter (E/W/H/I)
  underline = true,           -- underline the broken code itself
  severity_sort = true,       -- sort multiple diagnostics by severity
})
