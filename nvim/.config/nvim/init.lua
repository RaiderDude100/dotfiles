-- Qol
vim.opt.number = true
vim.opt.termguicolors = false
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.cmd [[
  highlight clear
  syntax reset
]]

-- Let terminal decide light/dark
vim.opt.background = "dark" -- or "light" if wallust generates light themes

-- DO NOT set a colorscheme
-- vim.cmd("colorscheme ...")  <-- intentionally omitted

-- Transparent backgrounds
vim.cmd [[
  highlight Normal       guibg=NONE ctermbg=NONE
  highlight NormalNC     guibg=NONE ctermbg=NONE
  highlight EndOfBuffer  guibg=NONE ctermbg=NONE
  highlight LineNr       guibg=NONE ctermbg=NONE
  highlight SignColumn   guibg=NONE ctermbg=NONE
  highlight FoldColumn   guibg=NONE ctermbg=NONE
]]

-- Floating windows transparency
vim.cmd [[
  highlight clear NormalFloat
  highlight clear FloatBorder
]]

-- Highlight
vim.cmd [[
  highlight Comment cterm=italic
  highlight Constant cterm=NONE
  highlight Identifier cterm=NONE
  highlight Statement cterm=bold
]]

-- Cursorline
vim.opt.cursorline = true
vim.cmd [[
  highlight CursorLine cterm=NONE ctermbg=0 guibg=NONE
  highlight CursorLineNr cterm=bold ctermfg=3 guifg=NONE
]]
