-- Qol
vim.opt.number = true
vim.opt.termguicolors = false
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"

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
  highlight NormalFloat ctermbg=0
  highlight FloatBorder ctermbg=0
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

vim.g.mapleader = " "

-------------------------------------------------
-- BOOTSTRAP lazy.nvim (PLUGIN MANAGER)
-------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------
-- PLUGINS
-------------------------------------------------
require("lazy").setup({

  -------------------------------------------------
  -- FILE EXPLORER
  -------------------------------------------------
  {
      vim.keymap.set(
        "n",
        "<leader>e",
        ":Ex<CR>",
        { silent = true }
      )
  },


  -------------------------------------------------
  -- TREESITTER (SYNTAX HIGHLIGHTING)
  -------------------------------------------------
  {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "python" },
    highlight = {
      enable = true,
      },
    },
  },


  -------------------------------------------------
  -- LSP (PYTHON INTELLIGENCE)
  -------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
                    },
                },
            },
        })

     vim.lsp.enable("pyright")
    end,
  },


  -------------------------------------------------
  -- AUTOCOMPLETION
  -------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end
  },

  -------------------------------------------------
  -- DEBUGGER (OPTIONAL, IDLE-LIKE)
  -------------------------------------------------
  { "mfussenegger/nvim-dap" },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end
  },

  -------------------------------------------------
  -- STATUS LINE (OPTIONAL BUT NICE)
  -------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end
  },
})

-------------------------------------------------
-- KEYMAPS (RUN PYTHON LIKE IDLE)
-------------------------------------------------
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  local ext = vim.fn.expand("%:e")
  
  if ext == "py" then
    vim.cmd("split | terminal python3 '" .. file .. "'")
  elseif ext == "js" then
    vim.cmd("split | terminal node '" .. file .. "'")
  elseif ext == "sh" or ext == "bash" then
    vim.cmd("split | terminal bash '" .. file .. "'")
  elseif ext == "rb" then
    vim.cmd("split | terminal ruby '" .. file .. "'")
  elseif ext == "pl" then
    vim.cmd("split | terminal perl '" .. file .. "'")
  elseif ext == "php" then
    vim.cmd("split | terminal php '" .. file .. "'")
  elseif ext == "go" then
    vim.cmd("split | terminal go run '" .. file .. "'")
  elseif ext == "rs" then
    vim.cmd("split | terminal cargo run")
  elseif ext == "java" then
    vim.cmd("split | terminal java '" .. file .. "'")
  elseif ext == "c" then
    local out = vim.fn.expand("%:r")
    vim.cmd("split | terminal gcc '" .. file .. "' -o '" .. out .. "' && ./'" .. out .. "'")
  elseif ext == "cpp" or ext == "cc" then
    local out = vim.fn.expand("%:r")
    vim.cmd("split | terminal g++ '" .. file .. "' -o '" .. out .. "' && ./'" .. out .. "'")
  elseif ext == "html" then
    vim.cmd("split | terminal xdg-open '" .. file .. "'")
  elseif ext == "md" then
    vim.cmd("split | terminal glow '" .. file .. "'")
  else
    vim.cmd("split | terminal xdg-open '" .. file .. "'")
  end
end)

-------------------------------------------------
-- LSP KEYMAPS (IDE FEATURES)
-------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end
})
