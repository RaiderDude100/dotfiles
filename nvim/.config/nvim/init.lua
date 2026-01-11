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
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      })

      vim.keymap.set(
        "n",
        "<leader>e",
        ":NvimTreeToggle<CR>",
        { silent = true }
      )
    end,
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
  vim.cmd("split | terminal python3 %")
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
